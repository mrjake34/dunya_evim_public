// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends Equatable {
  final String? email;
  final String? password;

  LoginRequestModel({this.email, this.password});

  @override
  List<Object?> get props => [email, password];

  Map<String, dynamic> toMap() => _$LoginRequestModelToJson(this);

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) => _$LoginRequestModelFromJson(map);

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) => LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
