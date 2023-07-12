import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/core/constants/enums/firebase_enums.dart';
import 'package:dunya_evim/core/constants/enums/user_enums.dart';
import 'package:dunya_evim/screens/adverts/bloc/advert_bloc.dart';
import 'package:dunya_evim/screens/profile/model/user_model.dart';
import 'package:dunya_evim/screens/profile/service/profile_service.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/enums/bloc_enums.dart';
import '../../adverts/model/advert_model.dart';
import '../../adverts/service/advert_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

final class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) async {
      await fetchProfile(event.userId);
    });
    on<AddAdvertToMyAdvertList>((event, emit) async {
      await addAdvertToMyAdvertList(event.docId);
    });
    on<ChooseProfilePhotoEvent>((event, emit) async {
      await pickPpImage(event.file);
    });
    on<EditPhoneNumberEvent>((event, emit) async {
      if (event.phone != null && state.countryCode != null) {
        await editPhoneNumber(event.phone);
      }
    });
    on<EditDialCodeEvent>((event, emit) async {
      if (event.code != null) {
        safeEmit(state.copyWith(countryCode: event.code));
      }
    });
    on<EditUserBioEvent>((event, emit) async {
      if (event.biography != null) {
        editBiography(event.biography);
      }
    });
    on<ResendVerifyEmailEvent>((event, emit) async {
      final user = FirebaseService().firebaseAuth.currentUser;
      if (user != null) {
        if (user.emailVerified == false) {
          safeEmit(state.copyWith(verifyEmailResender: Status.loading));
          user.sendEmailVerification();
          safeEmit(state.copyWith(verifyEmailResender: Status.success));
        }
      }
    });
    on<FetchMyAdvertsEvent>((event, emit) async {
      if (state.userModel?.userAdvertList != null) {
        fetchMyAdverts(state.userModel?.userAdvertList);
      }
    });
  }
  void clear() {
    safeEmit(ProfileInitial());
  }

  Future<void> addAdvertToMyAdvertList(String? docId) async {
    if (docId != null) {
      await FirebaseService.instance.userCollection.doc(state.userModel?.uid).update({
        FireStoreEnums.userAdvertList.value: FieldValue.arrayUnion([docId])
      });
      if (state.userModel?.uid != null) {
        await fetchProfile(state.userModel!.uid);
      }
    }
  }

  Future<void> fetchProfile(String? userId) async {
    safeEmit(state.copyWith(status: Status.loading));
    if (userId != null) {
      final response = await ProfileService().fetchUserProfileDetails(userID: userId);
      final userModel = await response.get().then((value) => value.data());
      if (userModel != null) {
        safeEmit(state.copyWith(status: Status.success, userModel: userModel));
      } else {
        safeEmit(state.copyWith(status: Status.failed));
      }
    } else {
      safeEmit(state.copyWith(status: Status.failed));
    }
  }

  Future<void> pickPpImage(XFile? file) async {
    if (file != null) {
      final path = '${state.userModel?.uid}/${UserEnums.profilePhoto.value}/${UserEnums.userPP.value}';
      final filePath = File(file.path);
      final ref = FirebaseService.instance.firebaseStorage.ref(FireStoreEnums.users.value).child(path);

      final uploadTask = ref.putFile(filePath);

      final snapshot = await uploadTask.whenComplete(() {});

      final url = await snapshot.ref.getDownloadURL();
      if (url.isNotEmpty) {
        await FirebaseService.instance.userCollection.doc(state.userModel?.uid).update({
          UserEnums.ppUrl.value: url,
        });
        await fetchProfile(state.userModel?.uid);
      }
    }
  }

  Future<void> editPhoneNumber(String? phone) async {
    await FirebaseService().userCollection.doc(state.userModel?.uid).update({
      UserEnums.phone.value: '${state.countryCode?.dialCode}$phone',
    });
    await fetchProfile(state.userModel?.uid);
  }

  Future<void> editLocation(CountryCode country) async {
    await FirebaseService()
        .userCollection
        .doc(
          state.userModel?.uid,
        )
        .update(
      {UserEnums.country.value: country.name, UserEnums.dialCode.value: country.dialCode, UserEnums.countryCode.value: country.code},
    );
    await fetchProfile(
      state.userModel?.uid,
    );
  }

  Future<void> editBiography(String? biography) async {
    await FirebaseService().userCollection.doc(state.userModel?.uid).update({
      UserEnums.userBio.value: biography,
    });
    await fetchProfile(state.userModel?.uid);
  }

  Future<void> fetchMyAdverts(List<String>? advertList) async {
    safeEmit(state.copyWith(status: Status.loading));
    List<AdvertModel> myAdverts = [];
    if (advertList != null) {
      final response = await AdvertService().fectAdvertModelList();
      for (var element in advertList) {
        final doc = await response.doc(element).get();

        if (doc.exists) {
          myAdverts.add(doc.data()!);
        }
      }
      if (myAdverts.isNotEmpty) {
        myAdverts.sort(
          (a, b) => b.advertTime!.compareTo(a.advertTime!),
        );
        return safeEmit(state.copyWith(myAdvertList: myAdverts, status: Status.success));
      }
    } else {
      return safeEmit(state.copyWith(status: Status.failed));
    }
  }
}
