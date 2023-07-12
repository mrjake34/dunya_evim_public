// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? fullName;
  final String? email;
  final String? uid;
  final String? phone;
  final String? country;
  final String? ppUrl;
  final String? userBio;
  final double? userRegisterLatitude;
  final double? userRegisterLongitude;
  final List<String>? myFavoriteList;
  final List<String>? userAdvertList;

  UserModel({
    this.fullName,
    this.email,
    this.uid,
    this.phone,
    this.country,
    this.ppUrl,
    this.userBio,
    this.userRegisterLatitude,
    this.userRegisterLongitude,
    this.myFavoriteList,
    this.userAdvertList,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        uid,
        phone,
        country,
        ppUrl,
        userBio,
        userRegisterLatitude,
        userRegisterLongitude,
        myFavoriteList,
        userAdvertList,
      ];

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserModel copyWith({
    String? fullName,
    String? email,
    String? uid,
    String? phone,
    String? country,
    String? ppUrl,
    String? userBio,
    double? userRegisterLatitude,
    double? userRegisterLongitude,
    List<String>? myFavoriteList,
    List<String>? userAdvertList,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      ppUrl: ppUrl ?? this.ppUrl,
      userBio: userBio ?? this.userBio,
      userRegisterLatitude: userRegisterLatitude ?? this.userRegisterLatitude,
      userRegisterLongitude: userRegisterLongitude ?? this.userRegisterLongitude,
      myFavoriteList: myFavoriteList ?? this.myFavoriteList,
      userAdvertList: userAdvertList ?? this.userAdvertList,
    );
  }
}
