import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dunya_evim/screens/profile/service/profile_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/bloc_enums.dart';
import '../../../core/constants/enums/firebase_enums.dart';
import '../../profile/model/user_model.dart';
import '../model/advert_detail_model.dart';
import '../model/advert_model.dart';
import '../service/advert_service.dart';

part 'advert_event.dart';
part 'advert_state.dart';

base class BaseBloc<V, T> extends Bloc<V, T> {
  BaseBloc(super.initialState);
  void safeEmit(T state) {
    if (isClosed) return;
    emit(state);
  }
}

final class AdvertBloc extends BaseBloc<AdvertEvent, AdvertState> {
  AdvertBloc() : super(AdvertState()) {
    on<FetchAdvertsEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      CollectionReference<AdvertModel?> response = await AdvertService().fectAdvertModelList();
      final advert = await response.where(FireStoreEnums.approved.value, isEqualTo: true).get().then((value) => value.docs);
      if (advert.isNotEmpty) {
        safeEmit(state.copyWith(status: Status.success, advertList: advert));
      } else {
        safeEmit(state.copyWith(status: Status.failed));
      }
    });
    on<FetchAdvertDetailEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      if (event.docId != null) {
        final response = await AdvertService().fectAdvertDetailModel(docId: event.docId!);
        final responseImage = await AdvertService().fectAdvertDetailImageList(docId: event.docId!);
        if (response?.data() != null && responseImage?.data() != null) {
          final advert = await AdvertDetailModel.fromJson(response!.data()!);
          final user = await AdvertService().fetchAdvertOwnerProfile(userID: advert.ownerId);
          final userModel = await user.get().then((value) => value.data());
          final images = await responseImage?.data()?[FireStoreEnums.urlList.value];
          safeEmit(state.copyWith(status: Status.success, advertDetailModel: advert, imageList: images, advertOwnerModel: userModel));
        } else {
          safeEmit(state.copyWith(status: Status.failed));
        }
      }
    });
    on<AddAdvertsEvet>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      if (event.advertModel != null && event.advertDetailModel != null && event.urlList != null && event.email != null) {
        final response = await AdvertService().addAdvertModel(
            advertModel: event.advertModel!, advertDetailModel: event.advertDetailModel!, urlList: event.urlList!, email: event.email!);
        if (response == true) {
          safeEmit(state.copyWith(status: Status.success));
          
        } else {
          safeEmit(state.copyWith(status: Status.failed));
        }
      }
    });
  }
}
