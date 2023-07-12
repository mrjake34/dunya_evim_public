part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchProfileEvent extends ProfileEvent {
  final String? userId;

  FetchProfileEvent({this.userId});
  @override
  List<Object?> get props => [userId];
}

class AddAdvertToMyAdvertList extends ProfileEvent {
  final String? docId;

  AddAdvertToMyAdvertList({this.docId});
}

class ChooseProfilePhotoEvent extends ProfileEvent {
  final XFile? file;

  ChooseProfilePhotoEvent({this.file});
}

class EditUserLocationEvent extends ProfileEvent {
  final CountryCode? country;

  EditUserLocationEvent({this.country});
}

class EditPhoneNumberEvent extends ProfileEvent {
  final String? phone;
  final CountryCode? code;

  EditPhoneNumberEvent({this.code, this.phone});
}

class EditDialCodeEvent extends ProfileEvent {
  final CountryCode? code;

  EditDialCodeEvent({this.code});
}

class EditUserBioEvent extends ProfileEvent {
  final String? biography;

  EditUserBioEvent({this.biography});
}

class ResendVerifyEmailEvent extends ProfileEvent {}
class FetchMyAdvertsEvent extends ProfileEvent {}
