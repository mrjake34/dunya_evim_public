import 'dart:io';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/core/constants/enums/firebase_enums.dart';
import 'package:dunya_evim/screens/adverts/model/advert_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/base/class/base_bloc.dart';
import '../../../../../core/constants/enums/advert_enums.dart';
import '../../../../../core/constants/enums/bloc_enums.dart';
import '../../../../../core/constants/prefs.dart';
import '../../adverts/model/advert_detail_model.dart';
part 'add_advert_event.dart';
part 'add_advert_state.dart';

final class AddAdvertBloc extends BaseBloc<AddAdvertEvent, AddAdvertState> {
  final ImagePicker _picker = ImagePicker();
  AddAdvertBloc() : super(AddAdvertInitial()) {
    on<ChangeCurrencyEvent>((event, emit) async {
      changeCurrency(event);
    });
    on<AddNewAdvertDetailEvent>((event, emit) {
      addNewAdvertDetail(event);
    });
    on<AddAdvertTypeEvent>((event, emit) {
      addAdvertType(event);
    });
    on<AddNumberOfRoomsEvent>((event, emit) {
      addNumberOfRooms(event);
    });
    on<AddFurnitureEvent>((event, emit) {
      addFurniture(event);
    });
    on<AddCanVideoCallEvent>((event, emit) {
      addCanVideoCall(event);
    });
    on<AddInSiteEvent>((event, emit) {
      addInSite(event);
    });
    on<AddCitizenshipRightsEvent>((event, emit) {
      addCitizenshipRights(event, emit);
    });
    on<AddHasGarageEvent>((event, emit) {
      addHasGarage(event);
    });
    on<AddAdvertNoteEvent>((event, emit) {
      addAdvertNote(event);
    });
    on<GetUserCurrentPositionEvent>((event, emit) async {
      await getUserCurrentPosition();
    });
    on<GetAddressFromLatLngEvent>((event, emit) async {
      await getAddressFromLatLng(event);
    });
    on<AddPhotosFromGalleryEvent>((event, emit) async {
      await addPhotosFromGallery();
    });
    on<AddPhotosFromCameraEvent>((event, emit) async {
      await addPhotosFromCamera();
    });
    on<RemovePhotoEvent>((event, emit) async {
      removePhoto(event);
    });
    on<SendAdvertData>((event, emit) async {
      await uploadPhoto(event);
    });
  }
  void clear() {
    safeEmit(AddAdvertInitial());
  }

  void changeCurrency(ChangeCurrencyEvent event) {
    if (event.currencyIcon != null && event.currencyTextInputFormatter != null) {
      if (state.price != null) {
        safeEmit(state.copyWith(currencyIcon: event.currencyIcon, currencyTextInputFormatter: event.currencyTextInputFormatter, price: ''));
      } else {
        safeEmit(state.copyWith(currencyIcon: event.currencyIcon, currencyTextInputFormatter: event.currencyTextInputFormatter));
      }
    }
  }

  void addNewAdvertDetail(AddNewAdvertDetailEvent event) {
    if (event.title != null ||
    event.price != null ||
    event.livingArea != null ||
    event.ageOfConstruction != null ||
    event.floorInConstruction != null ||
    event.totalFloorInConstruction != null ||
    event.heatingSystem != null) {
  safeEmit(
    state.copyWith(
      title: event.title,
      price: event.price,
      livingArea: event.livingArea,
      ageOfConstruction: event.ageOfConstruction,
      floorInConstruction: event.floorInConstruction,
      totalFloorInConstruction: event.totalFloorInConstruction,
      heatingSystem: event.heatingSystem,
    ),
  );
}

  }

  void addAdvertType(AddAdvertTypeEvent event) {
    if (event.advertTypeEnums != null) {
      safeEmit(state.copyWith(advertTypeEnums: event.advertTypeEnums));
    }
  }

  void addNumberOfRooms(AddNumberOfRoomsEvent event) {
    if (event.numberOfRooms != null) {
      safeEmit(state.copyWith(numberOfRooms: event.numberOfRooms));
    }
  }

  void addFurniture(AddFurnitureEvent event) {
    if (event.furnitureEnums != null) {
      safeEmit(state.copyWith(furnitureEnums: event.furnitureEnums));
    }
  }

  void addCanVideoCall(AddCanVideoCallEvent event) {
    if (event.canVideoCallEnums != null) {
      safeEmit(state.copyWith(canVideoCallEnums: event.canVideoCallEnums));
    }
  }

  void addInSite(AddInSiteEvent event) {
    if (event.inSiteEnums != null) {
      safeEmit(state.copyWith(inSiteEnums: event.inSiteEnums));
    }
  }

  void addCitizenshipRights(AddCitizenshipRightsEvent event, emit) {
    if (event.citizenshipRightsEnums != null) {
      safeEmit(state.copyWith(citizenshipRightsEnums: event.citizenshipRightsEnums));
    }
  }

  void addHasGarage(AddHasGarageEvent event) {
    if (event.hasGarageEnums != null) {
      safeEmit(state.copyWith(hasGarageEnums: event.hasGarageEnums));
    }
  }

  void addAdvertNote(AddAdvertNoteEvent event) {
    if (event.advertNote != null) {
      safeEmit(state.copyWith(note: event.advertNote));
    }
  }

  Future<void> getUserCurrentPosition() async {
    final Position? position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (position != null) {
      safeEmit(state.copyWith(userCurrentPosition: position));
    }
  }

  Future<void> getAddressFromLatLng(GetAddressFromLatLngEvent event) async {
    safeEmit(state.copyWith(status: Status.loading));
    if (event.latitude != null && event.longitude != null) {
      final position = await Geocoder2.getDataFromCoordinates(latitude: event.latitude!, longitude: event.longitude!, googleMapApiKey: mapsApi);
      if (position.toString().isNotEmpty) {
        safeEmit(
          state.copyWith(
            address: position.address,
            city: position.city,
            country: position.country,
            state: position.state,
            countryCode: position.countryCode,
            latitude: event.latitude,
            longitude: event.longitude,
            status: Status.success,
          ),
        );
      }
    } else {
      safeEmit(state.copyWith(status: Status.failed));
    }
  }

  Future<void> addPhotosFromGallery() async {
    final List<XFile> result = await _picker.pickMultiImage(
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (result.isNotEmpty) {
      List<XFile>? newList = List.from(state.files ?? []);

      if (newList.isNotEmpty) {
        newList.addAll(result);
        safeEmit(state.copyWith(files: newList));
      } else {
        safeEmit(state.copyWith(files: result));
      }
    }
  }

  Future<void> addPhotosFromCamera() async {
    final XFile? result = await _picker.pickImage(maxWidth: 1024, maxHeight: 1024, imageQuality: 85, source: ImageSource.camera);
    List<XFile>? newList = List.from(state.files ?? []);

    if (result != null) {
      newList.add(result);
      if (newList.isNotEmpty) {
        safeEmit(state.copyWith(files: newList));
      }
    }
  }

  void removePhoto(RemovePhotoEvent event) {
    if (event.index != null) {
      List<XFile>? newList = List.from(state.files ?? []);
      if (newList.isNotEmpty) {
        newList.removeAt(event.index!);
        safeEmit(state.copyWith(files: newList));
      }
    }
  }

  Future<void> sendAdvertData(SendAdvertData event) async {
    if (event.uid != null && event.userMail != null) {
      safeEmit(state.copyWith(advertDatasUploaded: Status.loading));
      final advertDetailModel = AdvertDetailModel(
        address: state.address,
        advertTime: DateFormat("dd-MM-yyyy HH:mm").format(DateTime.now()),
        advertType: state.advertTypeEnums?.value,
        ageOfConstruction: state.ageOfConstruction,
        canVideoCall: state.canVideoCallEnums?.value,
        citizenship: state.citizenshipRightsEnums?.value,
        city: state.city,
        country: state.country,
        state: state.state,
        floorInConstruction: state.floorInConstruction,
        totalFloorInConstruction: state.totalFloorInConstruction,
        hasFurnitureInHouse: state.furnitureEnums?.value,
        heatingSystem: state.heatingSystem,
        latitude: state.latitude,
        longitude: state.longitude,
        livingArea: state.livingArea,
        note: state.note,
        price: state.price,
        numberOfRooms: state.numberOfRooms,
        hasGarage: state.hasGarageEnums?.value,
        inSite: state.inSiteEnums?.value,
        title: state.title,
        ownerId: event.uid,
        id: state.docId,
      );
      final advertModel = AdvertModel(
        title: state.title,
        price: state.price,
        address: state.address,
        smallImageUrl: state.photosUrlList?.first,
        docId: state.docId,
        country: state.country,
        advertType: state.advertTypeEnums?.value,
        advertTime: DateFormat("dd-MM-yyyy HH:mm").format(DateTime.now()),
        hasMessage: false,
        homeSlider: false,
        approved: false,
        ownerMail: event.userMail,
        ownerUid: event.uid,
      );
      final docRef = FirebaseService().advertsCollection.doc(state.docId);
      final colRef = docRef.collection(FireStoreEnums.data.value);
      try {
        await docRef.update(advertModel.toJson());
        await colRef.doc(FireStoreEnums.advertDetails.value).set(advertDetailModel.toJson());
        await colRef.doc(FireStoreEnums.imageList.value).set({
          FireStoreEnums.urlList.value: state.photosUrlList,
        });
      } on Exception {
        safeEmit(state.copyWith(advertDatasUploaded: Status.failed));
      }
      safeEmit(state.copyWith(advertDatasUploaded: Status.success));
    } else {
      safeEmit(state.copyWith(advertDatasUploaded: Status.failed));
    }
  }

  Future<void> uploadPhoto(SendAdvertData event) async {
    safeEmit(state.copyWith(photoUrlUploaded: Status.loading));
    if (event.uid != null) {
      String? docId;

      docId = await FirebaseService().advertsCollection.add({
        FireStoreEnums.ownerUid.value: event.uid,
      }).then((value) => value.id);
      if (docId != null) {
        final fireStorageRef =
            await FirebaseService().firebaseStorage.ref(FireStoreEnums.users.value).child("${event.uid}/${FireStoreEnums.adverts.value}/${docId}");
        final images = await fireStorageRef.listAll();
        if (images.items.isNotEmpty) {
          for (var item in images.items) {
            item.delete();
          }
          safeEmit(state.copyWith(photosUrlList: []));
          ;
        }
        int name = 0;
        for (var file in state.files!) {
          final uploadTask = fireStorageRef.child('${name}.jpg').putFile(File(file.path));
          final List<String> newList = List.from(state.photosUrlList ?? []);
          // final snapshot = await uploadTask.whenComplete(() {});
          final downloadUrl = await uploadTask.then((p0) => p0.ref.getDownloadURL());
          if (downloadUrl.isNotEmpty) {
            newList.add(downloadUrl);
            if (newList.isNotEmpty) {
              safeEmit(state.copyWith(photosUrlList: newList, docId: docId, uploadTask: uploadTask));
            }
          }
          name++;
          // final urlDownload = await snapshot.ref.getDownloadURL();
        }
        sendAdvertData(event);
        safeEmit(state.copyWith(photoUrlUploaded: Status.success));
      }
    } else {
      safeEmit(state.copyWith(photoUrlUploaded: Status.failed));
    }
  }
}
