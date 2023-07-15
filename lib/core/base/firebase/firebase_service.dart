import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dunya_evim/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../constants/enums/firebase_enums.dart';

interface class FirebaseService {
  static final FirebaseService _instance = FirebaseService._init();
  static bool _initialized = false;
  factory FirebaseService() => _instance;

  FirebaseService._init() {
    initializeFirebase();
  }
  Future<void> initializeFirebase() async {
    if (!_initialized) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _initialized = true;
    }
  }

  Future<void> initializeFirebaseTest() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
        );
  }

  static FirebaseService get instance => _instance;

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
  CollectionReference get userCollection => FirebaseFirestore.instance.collection(FirebaseEnums.users.value);
  CollectionReference get advertsCollection => FirebaseFirestore.instance.collection(FirebaseEnums.adverts.value);
  CollectionReference get blogCollection => FirebaseFirestore.instance.collection(FirebaseEnums.blog.value);
}
