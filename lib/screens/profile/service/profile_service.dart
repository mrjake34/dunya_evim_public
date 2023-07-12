import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/screens/profile/model/user_model.dart';

class ProfileService {
  Future<DocumentReference<UserModel?>> fetchUserProfileDetails({required String? userID}) async {
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
