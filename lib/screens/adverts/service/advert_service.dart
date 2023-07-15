import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/base/firebase/firebase_service.dart';
import '../../../core/constants/enums/firebase_enums.dart';
import '../../profile/model/user_model.dart';
import '../model/advert_detail_model.dart';
import '../model/advert_model.dart';

final class AdvertService {
  Future<List<AdvertModel>> fectAdvertModelList() async {
    final List<AdvertModel> advertList = [];
    final response = FirebaseService.instance.advertsCollection.where(FirebaseEnums.approved.value, isEqualTo: true).get();
    final documents = await response.then((value) => value.docs);
    if (documents.isNotEmpty) {
      for (var document in documents) {
        advertList.add(AdvertModel.fromJson(document.data() as Map<String, dynamic>));
      }
      if (advertList.isNotEmpty) {
        advertList.sort((a, b) => b.advertTime!.compareTo(a.advertTime!));
      }
    }
    return advertList;
  }

  Future<List<AdvertModel>?> fectAdvertModelListCountries(String? isoCountryCode) async {
    if (isoCountryCode != null) {
      final List<AdvertModel> advertList = [];
      final response = FirebaseService.instance.advertsCollection
          .where(FirebaseEnums.approved.value, isEqualTo: true)
          .where(FirebaseEnums.isoCountryCode.value, isEqualTo: isoCountryCode)
          .get();
      final documents = await response.then((value) => value.docs);
      if (documents.isNotEmpty) {
        for (var document in documents) {
          advertList.add(AdvertModel.fromJson(document.data() as Map<String, dynamic>));
        }
        if (advertList.isNotEmpty) {
          advertList.sort((a, b) => b.advertTime!.compareTo(a.advertTime!));
        }
      }
      return advertList;
    } else {
      return null;
    }
  }

  Future<List<AdvertModel>?> fectUserAdvertModelList(List<String> advertIdList) async {
    final List<AdvertModel> advertList = [];
    if (advertIdList.isNotEmpty) {
      for (var id in advertIdList) {
        final response = FirebaseService.instance.advertsCollection.doc(id).get();
        final documents = await response.then((value) => value.data());

        advertList.add(AdvertModel.fromJson(documents as Map<String, dynamic>));
      }
      return advertList;
    } else {
      return null;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>? fectAdvertDetailModel({required String docId}) async {
    final response =
        await FirebaseService.instance.advertsCollection.doc(docId).collection(FirebaseEnums.data.value).doc(FirebaseEnums.advertDetails.value).get();
    return response;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>? fectAdvertDetailImageList({required String docId}) async {
    final response =
        FirebaseService.instance.advertsCollection.doc(docId).collection(FirebaseEnums.data.value).doc(FirebaseEnums.imageList.value).get();
    return response;
  }

  Future<bool?> addAdvertModel(
      {required AdvertModel advertModel, required AdvertDetailModel advertDetailModel, required List urlList, required String email}) async {
    final documentReference = FirebaseService.instance.advertsCollection.doc(advertModel.docId);
    final docUsers = FirebaseService.instance.userCollection.doc(email);
    var details = documentReference.collection(FirebaseEnums.data.value).doc(FirebaseEnums.advertDetails.value);
    var images = documentReference.collection(FirebaseEnums.data.value).doc(FirebaseEnums.imageList.value);
    try {
      docUsers.update({
        FirebaseEnums.userAdvertList.value: FieldValue.arrayUnion([advertModel.docId]),
      });
      documentReference.set(advertModel.toJson());
      details.set(advertDetailModel.toJson());
      images.set({
        FirebaseEnums.urlList.value: urlList,
      });
    } on Exception {
      return false;
    } finally {
      return true;
    }
  }

  Future<DocumentReference<UserModel?>> fetchAdvertOwnerProfile({required String? userID}) async {
    final response = FirebaseService.instance.userCollection.doc(userID).withConverter(
      fromFirestore: (snapshot, options) {
        if (snapshot.data() != null) {
          return UserModel.fromJson(snapshot.data()!);
        }
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseException(plugin: 'ProfileService - fetchUserProfileDetails');
        return value.toJson();
      },
    );
    return response;
  }
}
