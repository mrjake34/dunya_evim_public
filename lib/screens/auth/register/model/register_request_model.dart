// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends Equatable {
  final String? fullName;
  final String? country;
  final String? email;
  final String? password;
  final String? uid;

  RegisterRequestModel({this.fullName, this.country, this.email, this.password, this.uid});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);

  @override
  List<Object?> get props => [fullName, country, email, password, uid];

  RegisterRequestModel copyWith({
    String? fullName,
    String? country,
    String? email,
    String? password,
    String? uid,
  }) {
    return RegisterRequestModel(
      fullName: fullName ?? this.fullName,
      country: country ?? this.country,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }
}
