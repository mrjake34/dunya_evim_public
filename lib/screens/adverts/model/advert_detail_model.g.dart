// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertDetailModel _$AdvertDetailModelFromJson(Map<String, dynamic> json) =>
    AdvertDetailModel(
      address: json['address'] as String?,
      advertTime: json['advertTime'] as String?,
      advertType: json['advertType'] as String?,
      ageOfConstruction: json['ageOfConstruction'] as String?,
      canVideoCall: json['canVideoCall'] as String?,
      citizenship: json['citizenship'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      floorInConstruction: json['floorInConstruction'] as String?,
      totalFloorInConstruction: json['totalFloorInConstruction'] as String?,
      hasFurnitureInHouse: json['hasFurnitureInHouse'] as String?,
      heatingSystem: json['heatingSystem'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      livingArea: json['livingArea'] as String?,
      note: json['note'] as String?,
      price: json['price'] as String?,
      numberOfRooms: json['numberOfRooms'] as String?,
      hasGarage: json['hasGarage'] as String?,
      inSite: json['inSite'] as String?,
      title: json['title'] as String?,
      ownerId: json['ownerId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AdvertDetailModelToJson(AdvertDetailModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'advertTime': instance.advertTime,
      'advertType': instance.advertType,
      'ageOfConstruction': instance.ageOfConstruction,
      'canVideoCall': instance.canVideoCall,
      'citizenship': instance.citizenship,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'floorInConstruction': instance.floorInConstruction,
      'totalFloorInConstruction': instance.totalFloorInConstruction,
      'hasFurnitureInHouse': instance.hasFurnitureInHouse,
      'heatingSystem': instance.heatingSystem,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'livingArea': instance.livingArea,
      'note': instance.note,
      'price': instance.price,
      'numberOfRooms': instance.numberOfRooms,
      'hasGarage': instance.hasGarage,
      'inSite': instance.inSite,
      'title': instance.title,
      'ownerId': instance.ownerId,
      'id': instance.id,
    };
