import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'local_notification.dart';

class FirebaseNotificationService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  void settingNotification() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  void connectionNotification() async{
    await Firebase.initializeApp();

    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //print('gelen bildirim başlık ${message.notification!.title}');
      //print('gelen bildirim içeriği ${message.notification!.body}');

      if(message.notification != null){
        //print('Message: ${message.notification}');
        LocalNotificationService.createNotification(message);
      }
    });
    messaging.getToken().then((value) {
      log('Token : $value', name: 'FCm token');
    });
  }
  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    //print('handling a backgroung message ${message.messageId}');
  }

  void showNotification() {}
}