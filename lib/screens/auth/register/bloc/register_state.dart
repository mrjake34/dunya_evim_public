// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.status, this.firebaseAuthErrorEnums, this.isUserAgreementAccepted, this.passVisibility, this.rePassVisibility, this.country});
  final Status? status;
  final FirebaseAuthErrorEnums? firebaseAuthErrorEnums;
  final bool? isUserAgreementAccepted;
  final bool? passVisibility;
  final bool? rePassVisibility;
  final CountryCode? country;

  @override
  List<Object?> get props => [status, firebaseAuthErrorEnums, isUserAgreementAccepted, passVisibility, rePassVisibility, country];

  RegisterState copyWith({
    Status? status,
    FirebaseAuthErrorEnums? firebaseAuthErrorEnums,
    bool? isUserAgreementAccepted,
    bool? passVisibility,
    bool? rePassVisibility,
    CountryCode? country,
  }) {
    return RegisterState(
      status: status ?? this.status,
      firebaseAuthErrorEnums: firebaseAuthErrorEnums ?? this.firebaseAuthErrorEnums,
      isUserAgreementAccepted: isUserAgreementAccepted ?? this.isUserAgreementAccepted,
      passVisibility: passVisibility ?? this.passVisibility,
      rePassVisibility: rePassVisibility ?? this.rePassVisibility,
      country: country ?? this.country,
    );
  }
}
