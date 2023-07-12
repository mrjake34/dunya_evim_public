part of 'pass_reset_bloc.dart';

abstract class PassResetEvent extends Equatable {
  const PassResetEvent();

  @override
  List<Object?> get props => [];
}

class PassResetEmailSender extends PassResetEvent {
  final String? email;

  PassResetEmailSender({this.email});
  @override
  List<Object?> get props => [email];
}

class ClearPassResetErrorEvent extends PassResetEvent {}
