import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/base/firebase/firebase_service.dart';
import '../../../core/constants/enums/firebase_enums.dart';
import '../../profile/model/user_model.dart';
import '../model/advert_detail_model.dart';
import '../model/advert_model.dart';

class AdvertService {
  Future<CollectionReference<AdvertModel?>> fectAdvertModelList() async {
    final response = FirebaseService.instance.advertsCollection.withConverter(
      fromFirestore: (snapshot, options) {
        final jsonData = snapshot.data();
        if (jsonData == null) return null;
        return AdvertModel.fromJson(jsonData).copyWith(docId: snapshot.id);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseException(plugin: 'AdvertService - fectAdvertList');
        return value.toJson();
      },
    );
    
    return response;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>? fectAdvertDetailModel({required String docId}) async {
    final response = await FirebaseService.instance.advertsCollection
        .doc(docId)
        .collection(FireStoreEnums.data.value)
        .doc(FireStoreEnums.advertDetails.value)
        .get();
    return response;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>? fectAdvertDetailImageList({required String docId}) async {
    final response =
        FirebaseService.instance.advertsCollection.doc(docId).collection(FireStoreEnums.data.value).doc(FireStoreEnums.imageList.value).get();
    return response;
  }

  Future<bool?> addAdvertModel(
      {required AdvertModel advertModel, required AdvertDetailModel advertDetailModel, required List urlList, required String email}) async {
    final documentReference = FirebaseService.instance.advertsCollection.doc(advertModel.docId);
    final docUsers = FirebaseService.instance.userCollection.doc(email);
    var details = documentReference.collection(FireStoreEnums.data.value).doc(FireStoreEnums.advertDetails.value);
    var images = documentReference.collection(FireStoreEnums.data.value).doc(FireStoreEnums.imageList.value);
    try {
      docUsers.update({
        FireStoreEnums.userAdvertList.value: FieldValue.arrayUnion([advertModel.docId]),
      });
      documentReference.set(advertModel.toJson());
      details.set(advertDetailModel.toJson());
      images.set({
        FireStoreEnums.urlList.value: urlList,
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
