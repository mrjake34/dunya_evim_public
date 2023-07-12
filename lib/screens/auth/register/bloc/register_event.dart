part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class PostUserRegisterEvent extends RegisterEvent {
  final RegisterRequestModel? model;

  PostUserRegisterEvent({this.model});
  @override
  List<Object?> get props => [model];
}

class UserAgreementEvent extends RegisterEvent {
  final bool? isUserAgreement;

  UserAgreementEvent({this.isUserAgreement});
  @override
  List<Object?> get props => [isUserAgreement];
}

class PassVisibilityEvent extends RegisterEvent {}

class RePassVisibilityEvent extends RegisterEvent {}

class RegisterClearErrorEvent extends RegisterEvent {}

class ChangeLocationEvent extends RegisterEvent {
  final CountryCode? country;

  ChangeLocationEvent({this.country});
}
