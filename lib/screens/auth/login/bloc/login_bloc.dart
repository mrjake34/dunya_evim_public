import 'dart:io';
import 'package:dunya_evim/core/constants/enums/firebase_enums.dart';
import 'package:dunya_evim/core/constants/enums/user_enums.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/base/class/base_bloc.dart';
import '../../../../core/base/firebase/firebase_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants/enums/bloc_enums.dart';
import '../model/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';

final class MockFirebaseService extends Mock implements FirebaseService {}

final class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final HmsApiAvailability client = HmsApiAvailability();
  final MockFirebaseService? firebaseService;
  final Geolocator? geolocator;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  LoginBloc({this.firebaseService, this.geolocator}) : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading, firebaseAuthErrorEnums: null));
      try {
        final response;
        if (event.model != null) {
          response = await FirebaseService.instance.firebaseAuth
              .signInWithEmailAndPassword(email: event.model?.email ?? '', password: event.model?.password ?? '');
          final SharedPreferences preferences = await prefs;
          await preferences.setString(UserEnums.userMail.value, event.model!.email!);
          await preferences.setString(UserEnums.password.value, event.model!.password!);
          safeEmit(state.copyWith(status: Status.success, userCredential: response));
        } else if (event.email != null && event.password != null) {
          response = await FirebaseService.instance.firebaseAuth.signInWithEmailAndPassword(email: event.email ?? '', password: event.password ?? '');
          safeEmit(state.copyWith(status: Status.success, userCredential: response));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseAuthErrorEnums.userNotFound.value) {
          safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.userNotFound));
        } else if (e.code == FirebaseAuthErrorEnums.wrongPassword.value) {
          safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.wrongPassword));
        } else if (e.code == FirebaseAuthErrorEnums.manyTried.value) {
          safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.manyTried));
        } else {
          safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.error));
        }
      }
    });
    on<UserLoginPasswordVisibilityEvent>((event, emit) {
      if (state.passwordVisibility == false) {
        safeEmit(state.copyWith(passwordVisibility: true));
      } else {
        safeEmit(state.copyWith(passwordVisibility: false));
      }
    });
    on<UserLoginClearLoginErrorEvent>((event, emit) {
      safeEmit(state.copyWith(firebaseAuthErrorEnums: null));
    });
    on<GetUserCurrentLocationEvent>((event, emit) async {
      LocationPermission? permission = await locationPermission();
      if (permission != null) {
        safeEmit(state.copyWith(locationServiceEnabled: true));
        if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
          final Position? position = await Geolocator.getCurrentPosition();
          if (position?.longitude != null) {
            safeEmit(state.copyWith(userCurrentPosition: position, locationPermission: LocationPermission.always));
          }
        } else {
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              safeEmit(state.copyWith(locationPermission: LocationPermission.denied));
            } else if (permission == LocationPermission.deniedForever) {
              emit(state.copyWith(locationPermission: LocationPermission.deniedForever));
            }
          } else if (permission == LocationPermission.deniedForever) {
            safeEmit(state.copyWith(locationPermission: LocationPermission.deniedForever));
          }
        }
      } else {
        safeEmit(state.copyWith(locationServiceEnabled: false));
      }
    });
    on<GetDeviceInfoEvent>((event, emit) async {
      final platform = await checkDevicePlatform();

      final huawei = await checkDeviceIsHuawei();
      if (platform != null && huawei != null) {
        safeEmit(state.copyWith(platform: platform, huaweiEnum: huawei));
      }
    });
  }
  void clear() {
    safeEmit(LoginInitial());
  }

  Future<HuaweiEnums?> checkDeviceIsHuawei() async {
    int index = await client.isHMSAvailable();
    switch (index) {
      case 0:
        return HuaweiEnums.isHuawei;
      case 1:
        return HuaweiEnums.notHuawei;
      case 3:
        return HuaweiEnums.huaweiButCoreOutdated;
      default:
        return HuaweiEnums.notHuawei;
    }
  }

  Future<PlatformEnums?> checkDevicePlatform() async {
    if (Platform.isIOS) {
      return PlatformEnums.IOS;
    } else if (Platform.isAndroid) {
      return PlatformEnums.ANDROID;
    } else if (Platform.isFuchsia) {
      return PlatformEnums.FUCHSIA;
    } else if (Platform.isLinux) {
      return PlatformEnums.LINUX;
    } else if (Platform.isMacOS) {
      return PlatformEnums.MACOS;
    } else if (Platform.isWindows) {
      return PlatformEnums.WINDOWS;
    } else if (kIsWeb) {
      return PlatformEnums.WEB;
    } else {
      return PlatformEnums.UNIDENTIFIED;
    }
  }

  Future<LocationPermission?> locationPermission() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      return await Geolocator.checkPermission();
    } else {
      return null;
    }
  }
}

enum PlatformEnums { IOS, ANDROID, MACOS, FUCHSIA, WINDOWS, LINUX, WEB, UNIDENTIFIED }

enum HuaweiEnums {
  isHuawei,
  notHuawei,
  huaweiButCoreOutdated,
}
