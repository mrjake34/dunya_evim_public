// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      ppUrl: json['ppUrl'] as String?,
      userBio: json['userBio'] as String?,
      userRegisterLatitude: (json['userRegisterLatitude'] as num?)?.toDouble(),
      userRegisterLongitude:
          (json['userRegisterLongitude'] as num?)?.toDouble(),
      myFavoriteList: (json['myFavoriteList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userAdvertList: (json['userAdvertList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'uid': instance.uid,
      'phone': instance.phone,
      'country': instance.country,
      'ppUrl': instance.ppUrl,
      'userBio': instance.userBio,
      'userRegisterLatitude': instance.userRegisterLatitude,
      'userRegisterLongitude': instance.userRegisterLongitude,
      'myFavoriteList': instance.myFavoriteList,
      'userAdvertList': instance.userAdvertList,
    };
