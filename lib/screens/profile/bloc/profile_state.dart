part of 'profile_bloc.dart';

final class ProfileState extends Equatable {
  final UserModel? userModel;
  final Status? status;
  final Status? ppPhotoStatus;
  final CountryCode? countryCode;
  final Status? verifyEmailResender;
  final List<AdvertModel>? myAdvertList;

  ProfileState({this.userModel, this.status, this.ppPhotoStatus, this.countryCode, this.verifyEmailResender, this.myAdvertList});

  @override
  List<Object?> get props {
    return [
      userModel,
      status,
      ppPhotoStatus,
      countryCode,
      verifyEmailResender,
      myAdvertList,
    ];
  }



  ProfileState copyWith({
    UserModel? userModel,
    Status? status,
    Status? ppPhotoStatus,
    CountryCode? countryCode,
    Status? verifyEmailResender,
    List<AdvertModel>? myAdvertList,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
      ppPhotoStatus: ppPhotoStatus ?? this.ppPhotoStatus,
      countryCode: countryCode ?? this.countryCode,
      verifyEmailResender: verifyEmailResender ?? this.verifyEmailResender,
      myAdvertList: myAdvertList ?? this.myAdvertList,
    );
  }
}

final class ProfileInitial extends ProfileState {}
