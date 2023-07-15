import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dunya_evim/screens/adverts/model/advert_detail_model.dart';
import 'package:dunya_evim/screens/adverts/service/advert_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/base/class/base_bloc.dart';
import '../../../core/base/firebase/firebase_service.dart';
import '../../../core/constants/enums/advert_enums.dart';
import '../../../core/constants/enums/bloc_enums.dart';
import '../../../core/constants/enums/firebase_enums.dart';
import '../../adverts/model/advert_model.dart';

part 'edit_advert_event.dart';
part 'edit_advert_state.dart';

final class EditAdvertBloc extends BaseBloc<EditAdvertEvent, EditAdvertState> {
  final ImagePicker _picker = ImagePicker();
  EditAdvertBloc() : super(EditAdvertInitial()) {
    on<FetchAdvertDetailEvent>((event, emit) {
      if (event.docId != null) {
        fetchAdvertDetail(event.docId);
      }
    });
    on<ChangeCurrencyEvent>((event, emit) {
      changeCurrency(event);
    });
    on<EditAdvertDetailEvent>((event, emit) {
      editAdvertDetail(event);
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
      if (event.index != null) {
        deletePhotoFromStorage(event.index!);
      }
    });
    on<SendAdvertData>((event, emit) async {
      await uploadPhoto(event);
    });
  }

  Future<void> fetchAdvertDetail(String? docId) async {
    safeEmit(state.copyWith(status: Status.loading));
    if (docId != null) {
      final response = await AdvertService().fectAdvertDetailModel(docId: docId);
      final imageResponse = await AdvertService().fectAdvertDetailImageList(docId: docId);
      if (response?.data() != null && imageResponse?.data() != null) {
        final model = AdvertDetailModel.fromJson(response!.data()!);
        final List<dynamic>? imageList;
        imageList = imageResponse?.data()?[FirebaseEnums.urlList.value] as List<dynamic>;
        safeEmit(state.copyWith(status: Status.success, model: model, photosUrlList: imageList, pathList: imageList));
      }
    } else {
      safeEmit(state.copyWith(status: Status.failed));
    }
  }

  void changeCurrency(ChangeCurrencyEvent event) {
    if (event.currencyIcon != null && event.currencyTextInputFormatter != null) {
      if (event.price != null) {
        safeEmit(state.copyWith(currencyIcon: event.currencyIcon, currencyTextInputFormatter: event.currencyTextInputFormatter, price: event.price));
      } else {
        safeEmit(state.copyWith(currencyIcon: event.currencyIcon, currencyTextInputFormatter: event.currencyTextInputFormatter));
      }
    }
  }

  void editAdvertDetail(EditAdvertDetailEvent event) {
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
      final position = await placemarkFromCoordinates(event.latitude!, event.longitude!);
      if (position.toString().isNotEmpty) {
        safeEmit(
          state.copyWith(
            address:
                '${position.first.country} / ${position.first.administrativeArea} / ${position.first.subAdministrativeArea} / ${position.first.locality}',
            city: position.first.administrativeArea,
            country: position.first.country,
            state: position.first.subAdministrativeArea,
            countryCode: position.first.isoCountryCode,
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
      List<dynamic>? newPathList = List.from(state.pathList ?? []);
      for (var element in result) {
        newPathList.add(element.path);
      }
      if (newList.isNotEmpty) {
        newList.addAll(result);
        safeEmit(state.copyWith(files: newList, pathList: newPathList));
      } else {
        safeEmit(state.copyWith(files: result, pathList: newPathList));
      }
    }
  }

  Future<void> addPhotosFromCamera() async {
    final XFile? result = await _picker.pickImage(maxWidth: 1024, maxHeight: 1024, imageQuality: 85, source: ImageSource.camera);
    List<XFile>? newList = List.from(state.files ?? []);
    List<dynamic>? newPathList = List.from(state.pathList ?? []);

    if (result != null) {
      newList.add(result);
      newPathList.add(result.path);
      if (newList.isNotEmpty && newPathList.isNotEmpty) {
        safeEmit(state.copyWith(files: newList, pathList: newPathList));
      }
    }
  }

  Future<void> sendAdvertData(SendAdvertData event) async {
    if (event.uid != null && event.userMail != null) {
      final advertDetailModel = AdvertDetailModel(
        address: state.address ?? state.model?.address,
        advertTime: DateFormat("dd-MM-yyyy HH:mm").format(DateTime.now()),
        advertType: state.advertTypeEnums?.value ?? state.model?.advertType,
        ageOfConstruction: state.ageOfConstruction ?? state.model?.ageOfConstruction,
        canVideoCall: state.canVideoCallEnums?.value ?? state.model?.canVideoCall,
        citizenship: state.citizenshipRightsEnums?.value ?? state.model?.citizenship,
        city: state.city ?? state.model?.city,
        country: state.country ?? state.model?.country,
        state: state.state ?? state.model?.state,
        floorInConstruction: state.floorInConstruction ?? state.model?.floorInConstruction,
        totalFloorInConstruction: state.totalFloorInConstruction ?? state.model?.totalFloorInConstruction,
        hasFurnitureInHouse: state.furnitureEnums?.value ?? state.model?.hasFurnitureInHouse,
        heatingSystem: state.heatingSystem ?? state.model?.heatingSystem,
        latitude: state.latitude ?? state.model?.latitude,
        longitude: state.longitude ?? state.model?.longitude,
        livingArea: state.livingArea ?? state.model?.livingArea,
        note: state.note ?? state.model?.note,
        price: state.price ?? state.model?.price,
        numberOfRooms: state.numberOfRooms ?? state.model?.numberOfRooms,
        hasGarage: state.hasGarageEnums?.value ?? state.model?.hasGarage,
        inSite: state.inSiteEnums?.value ?? state.model?.inSite,
        title: state.title ?? state.model?.title,
        ownerId: event.uid,
        id: state.docId ?? state.model?.id,
      );
      final advertModel = AdvertModel(
        title: state.title ?? state.model?.title,
        price: state.price ?? state.model?.price,
        address: state.address ?? state.model?.address,
        smallImageUrl: state.photosUrlList?.first ?? state.photosUrlList?.first,
        docId: state.docId ?? state.model?.id,
        country: state.country ?? state.model?.country,
        isoCountryCode: state.countryCode,
        advertType: state.advertTypeEnums?.value ?? state.model?.advertType,
        advertTime: DateFormat("dd-MM-yyyy HH:mm").format(DateTime.now()),
        hasMessage: false,
        homeSlider: false,
        approved: false,
        ownerMail: event.userMail,
        ownerUid: event.uid,
      );
      final docRef = FirebaseService().advertsCollection.doc(state.docId);
      final colRef = docRef.collection(FirebaseEnums.data.value);
      try {
        await docRef.update(advertModel.toJson());
        await colRef.doc(FirebaseEnums.advertDetails.value).set(advertDetailModel.toJson());
        await colRef.doc(FirebaseEnums.imageList.value).set({
          FirebaseEnums.urlList.value: state.photosUrlList,
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
    if (event.uid != null && state.files != null) {
      if (state.model?.id != null) {
        final fireStorageRef = await FirebaseService()
            .firebaseStorage
            .ref(FirebaseEnums.users.value)
            .child("${event.uid}/${FirebaseEnums.adverts.value}/${state.model?.id}");
        for (var file in state.files!) {
          final uploadTask = fireStorageRef.child('${file.name}.jpg').putFile(File(file.path));
          final List<String> newList = List.from(state.photosUrlList ?? []);
          final downloadUrl = await uploadTask.then((p0) => p0.ref.getDownloadURL());
          if (downloadUrl.isNotEmpty) {
            newList.add(downloadUrl);
            if (newList.isNotEmpty) {
              safeEmit(
                state.copyWith(
                  photosUrlList: newList,
                  docId: state.model?.id,
                  uploadTask: uploadTask,
                ),
              );
            }
          }
        }
        sendAdvertData(event);
      }
    } else {
      safeEmit(state.copyWith(photoUrlUploaded: Status.failed));
    }
  }

  Future<void> deletePhotoFromStorage(int index) async {
    final docRef = FirebaseService().advertsCollection.doc(state.model?.id);
    final colRef = docRef.collection(FirebaseEnums.data.value);
    final photo = state.pathList?.elementAt(index).toString();

    if (photo.toString().startsWith('https')) {
      final response = await FirebaseService()
          .firebaseStorage
          .ref(FirebaseEnums.users.value)
          .child("${state.model?.ownerId}/${FirebaseEnums.adverts.value}/${state.model?.id}");
      if (response.name.isNotEmpty) {
        await response.listAll().then((value) => value.items[index].delete());
        final imageRef = await AdvertService().fectAdvertDetailImageList(docId: state.model!.id!);
        if (imageRef?.data() != null) {
          final List<dynamic> imageList;
          imageList = await imageRef?.data()?[FirebaseEnums.urlList.value];
          if (imageList.isNotEmpty) {
            await imageList.removeAt(index);
            await colRef.doc(FirebaseEnums.imageList.value).update({
              FirebaseEnums.urlList.value: imageList,
            });
            safeEmit(state.copyWith(pathList: imageList));
          }
        }
      }
    } else if (photo.toString().startsWith('/data')) {
      final newList = List.from(state.pathList ?? []);
      await newList.removeAt(index);
      safeEmit(state.copyWith(pathList: newList));
    }
  }

  void clear() {
    safeEmit(EditAdvertInitial());
  }
}
