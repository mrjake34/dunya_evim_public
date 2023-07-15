import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dunya_evim/core/base/class/base_bloc.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/core/constants/enums/firebase_enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/bloc_enums.dart';

part 'my_adverts_event.dart';
part 'my_adverts_state.dart';

final class MyAdvertsBloc extends BaseBloc<MyAdvertsEvent, MyAdvertsState> {
  MyAdvertsBloc() : super(MyAdvertsInitial()) {
    on<StartListingEvent>((event, emit) {
      if (event.docId != null) {
        startListingAdvert(event.docId!);
      }
    });
    on<StopListingEvent>((event, emit) {
      if (event.docId != null) {
        stopListingAdvert(event.docId!);
      }
    });
    on<RemoveAdvertEvent>((event, emit) {
      if (event.docId != null && event.uid != null) {
        removeAdvert(docId: event.docId, uid: event.uid);
      }
    });
  }

  Future<void> startListingAdvert(String docId) async {
    if (docId.isNotEmpty) {
      safeEmit(state.copyWith(advertListingStatus: Status.loading));
      try {
        await FirebaseService.instance.advertsCollection.doc(docId).update({
          FirebaseEnums.stoppedByOwner.value: false,
          FirebaseEnums.approved.value: false,
        });
        safeEmit(state.copyWith(advertListingStatus: Status.success));
      } on Exception {
        safeEmit(state.copyWith(advertListingStatus: Status.failed));
      }
    }
  }

  Future<void> stopListingAdvert(String docId) async {
    if (docId.isNotEmpty) {
      safeEmit(state.copyWith(advertListingStatus: Status.loading));
      try {
        await FirebaseService.instance.advertsCollection.doc(docId).update({
          FirebaseEnums.stoppedByOwner.value: true,
          FirebaseEnums.approved.value: false,
        });
        safeEmit(state.copyWith(advertListingStatus: Status.success));
      } on Exception {
        safeEmit(state.copyWith(advertListingStatus: Status.failed));
      }
    }
  }

  Future<void> removeAdvert({String? docId, String? uid}) async {
    if (docId != null && uid != null) {
      safeEmit(state.copyWith(advertRemoveStatus: Status.loading));
      try {
        await FirebaseService.instance.advertsCollection.doc(docId).collection(FirebaseEnums.data.value).doc(FirebaseEnums.advertDetails.value).delete();
        await FirebaseService.instance.advertsCollection.doc(docId).collection(FirebaseEnums.data.value).doc(FirebaseEnums.imageList.value).delete();
        await FirebaseService.instance.advertsCollection.doc(docId).delete();
         
        await FirebaseService.instance.userCollection.doc(uid).update({
          FirebaseEnums.userAdvertList.value: FieldValue.arrayRemove([docId]),
        });
        final files = await FirebaseService.instance.firebaseStorage
            .ref()
            .child('${FirebaseEnums.users.value}/$uid/${FirebaseEnums.adverts.value}/$docId')
            .listAll();
        if (files.items.isNotEmpty) {
          for (var file in files.items) {
            file.delete();
          }
        }
        safeEmit(state.copyWith(advertRemoveStatus: Status.success));
      } on Exception {
        safeEmit(state.copyWith(advertRemoveStatus: Status.failed));
      }
    }
  }
}
