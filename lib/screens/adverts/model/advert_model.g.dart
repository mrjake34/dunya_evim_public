// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertModel _$AdvertModelFromJson(Map<String, dynamic> json) => AdvertModel(
      title: json['title'] as String?,
      price: json['price'] as String?,
      address: json['address'] as String?,
      smallImageUrl: json['smallImageUrl'] as String?,
      docId: json['docId'] as String?,
      category: json['category'] as String?,
      country: json['country'] as String?,
      advertType: json['advertType'] as String?,
      advertTime: json['advertTime'] as String?,
      hasMessage: json['hasMessage'] as bool?,
      adminMessage: json['adminMessage'] as String?,
      homeSlider: json['homeSlider'] as bool?,
      approved: json['approved'] as bool?,
      ownerMail: json['ownerMail'] as String?,
      ownerUid: json['ownerUid'] as String?,
      stoppedByOwner: json['stoppedByOwner'] as bool?,
      isoCountryCode: json['isoCountryCode'] as String?,
    );

Map<String, dynamic> _$AdvertModelToJson(AdvertModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'address': instance.address,
      'smallImageUrl': instance.smallImageUrl,
      'docId': instance.docId,
      'category': instance.category,
      'country': instance.country,
      'advertType': instance.advertType,
      'advertTime': instance.advertTime,
      'hasMessage': instance.hasMessage,
      'adminMessage': instance.adminMessage,
      'homeSlider': instance.homeSlider,
      'approved': instance.approved,
      'ownerMail': instance.ownerMail,
      'ownerUid': instance.ownerUid,
      'stoppedByOwner': instance.stoppedByOwner,
      'isoCountryCode': instance.isoCountryCode,
    };
