
part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final Status? status;
  final bool? passwordVisibility;
  final UserCredential? userCredential;
  final FirebaseAuthErrorEnums? firebaseAuthErrorEnums;
  final PlatformEnums? platform;
  final HuaweiEnums? huaweiEnum;
  final bool? locationServiceEnabled;
  final LocationPermission? locationPermission;
  final Position? userCurrentPosition;

  const LoginState({
    this.status,
    this.passwordVisibility,
    this.userCredential,
    this.firebaseAuthErrorEnums,
    this.platform,
    this.huaweiEnum,
    this.locationServiceEnabled,
    this.locationPermission,
    this.userCurrentPosition,
  });
  LoginState copyWith({
    Status? status,
    bool? passwordVisibility,
    UserCredential? userCredential,
    FirebaseAuthErrorEnums? firebaseAuthErrorEnums,
    PlatformEnums? platform,
    HuaweiEnums? huaweiEnum,
    bool? locationServiceEnabled,
    LocationPermission? locationPermission,
    Position? userCurrentPosition,
  }) {
    return LoginState(
      status: status ?? this.status,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      userCredential: userCredential ?? this.userCredential,
      firebaseAuthErrorEnums: firebaseAuthErrorEnums ?? this.firebaseAuthErrorEnums,
      platform: platform ?? this.platform,
      huaweiEnum: huaweiEnum ?? this.huaweiEnum,
      locationServiceEnabled: locationServiceEnabled ?? this.locationServiceEnabled,
      locationPermission: locationPermission ?? this.locationPermission,
      userCurrentPosition: userCurrentPosition ?? this.userCurrentPosition,
    );
  }

  @override
  List<Object?> get props => [
      status,
      passwordVisibility,
      userCredential,
      firebaseAuthErrorEnums,
      platform,
      huaweiEnum,
      locationServiceEnabled,
      locationPermission,
      userCurrentPosition,
    ];
}
final class LoginInitial extends LoginState {}