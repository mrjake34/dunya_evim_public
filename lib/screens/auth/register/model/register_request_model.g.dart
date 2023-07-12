// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      fullName: json['fullName'] as String?,
      country: json['country'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'country': instance.country,
      'email': instance.email,
      'password': instance.password,
      'uid': instance.uid,
    };
