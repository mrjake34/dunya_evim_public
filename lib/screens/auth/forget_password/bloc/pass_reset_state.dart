// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pass_reset_bloc.dart';

class PassResetState extends Equatable {
  const PassResetState({this.status,this.firebaseAuthErrorEnums});
  final Status? status;
  final FirebaseAuthErrorEnums? firebaseAuthErrorEnums;
  @override
  List<Object?> get props => [status, firebaseAuthErrorEnums];

  PassResetState copyWith({
    Status? status,
    FirebaseAuthErrorEnums? firebaseAuthErrorEnums,
  }) {
    return PassResetState(
      status: status ?? this.status,
      firebaseAuthErrorEnums: firebaseAuthErrorEnums ?? this.firebaseAuthErrorEnums,
    );
  }
}
