import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin localNotification =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    localNotification.initialize(initializationSettings);
  }
  NotificationDetails notificationDetails2 = const NotificationDetails(
    android: AndroidNotificationDetails("pushNotification",
        "Özel Bildirimler",
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher'
    ),
  );

  static void createNotification(RemoteMessage message) async{
    try {
      final id = DateTime.now().microsecond ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails("pushNotification",
            "İlan Bildirimleri",
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher'
        ),
      );
      await localNotification.show(id, message.notification?.title, message.notification?.body, notificationDetails);
    } on Exception catch (e) {
      //print(e);
    }
  }
}
