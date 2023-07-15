import 'package:dunya_evim/core/base/class/provider_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/base/firebase/firebase_service.dart';
import 'core/utils/navigation/navigation_router.dart';
import 'core/utils/navigation/navigation_service.dart';
import 'core/utils/snackbar/show_snackbar.dart';
import 'core/utils/translation/translation_manager.dart';
import 'firebase_notification_service.dart';
import 'home.dart';
import 'screens/auth/login/bloc/login_bloc.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(FirebaseNotificationService.backgroundMessage);
  await FirebaseService.instance.initializeFirebase();
  FirebaseNotificationService().settingNotification();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    TranslationManager(
      child: CustomMultiProvider(
        child: MyApp(),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(GetUserCurrentLocationEvent());
    context.read<LoginBloc>().add(GetDeviceInfoEvent());
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      scaffoldMessengerKey: ShowSnackbar.instance.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: const HomePage(),
      onGenerateRoute: NavigationRouter.instance.generateRoute,
    );
  }
}
