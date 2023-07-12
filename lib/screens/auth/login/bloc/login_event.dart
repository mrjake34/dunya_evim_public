// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final LoginRequestModel? model;
  UserLoginEvent({
    this.model,
  });

  @override
  List<Object?> get props => [model];
}

class UserLoginPasswordVisibilityEvent extends LoginEvent {}

class UserLoginClearLoginErrorEvent extends LoginEvent {}


class GetUserCurrentLocationEvent extends LoginEvent {}
class GetDeviceInfoEvent extends LoginEvent {}