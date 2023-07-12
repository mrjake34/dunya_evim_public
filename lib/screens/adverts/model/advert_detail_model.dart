// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advert_detail_model.g.dart';

@JsonSerializable()
class AdvertDetailModel extends Equatable {
  final String? address;
  final String? advertTime;
  final String? advertType;
  final String? ageOfConstruction;
  final String? canVideoCall;
  final String? citizenship;
  final String? city;
  final String? country;
  final String? state;
  final String? floorInConstruction;
  final String? totalFloorInConstruction;
  final String? hasFurnitureInHouse;
  final String? heatingSystem;
  final double? latitude;
  final double? longitude;
  final String? livingArea;
  final String? note;
  final String? price;
  final String? numberOfRooms;
  final String? hasGarage;
  final String? inSite;
  final String? title;
  final String? ownerId;
  final String? id;

  AdvertDetailModel({
    this.address,
    this.advertTime,
    this.advertType,
    this.ageOfConstruction,
    this.canVideoCall,
    this.citizenship,
    this.city,
    this.country,
    this.state,
    this.floorInConstruction,
    this.totalFloorInConstruction,
    this.hasFurnitureInHouse,
    this.heatingSystem,
    this.latitude,
    this.longitude,
    this.livingArea,
    this.note,
    this.price,
    this.numberOfRooms,
    this.hasGarage,
    this.inSite,
    this.title,
    this.ownerId,
    this.id,
  });

  @override
  List<Object?> get props {
    return [
      address,
      advertTime,
      advertType,
      ageOfConstruction,
      canVideoCall,
      citizenship,
      city,
      country,
      state,
      floorInConstruction,
      totalFloorInConstruction,
      hasFurnitureInHouse,
      heatingSystem,
      latitude,
      longitude,
      livingArea,
      note,
      price,
      numberOfRooms,
      hasGarage,
      inSite,
      title,
      ownerId,
      id,
    ];
  }

  Map<String, dynamic> toJson() => _$AdvertDetailModelToJson(this);

  factory AdvertDetailModel.fromJson(Map<String, dynamic> map) => _$AdvertDetailModelFromJson(map);

  AdvertDetailModel? copyWith({
    String? address,
    String? advertTime,
    String? advertType,
    String? ageOfConstruction,
    String? canVideoCall,
    String? citizenship,
    String? city,
    String? country,
    String? state,
    String? floorInConstruction,
    String? totalFloorInConstruction,
    String? hasFurnitureInHouse,
    String? heatingSystem,
    double? latitude,
    double? longitude,
    String? livingArea,
    String? note,
    String? price,
    String? numberOfRooms,
    String? hasGarage,
    String? inSite,
    String? title,
    String? ownerId,
    String? id,
  }) {
    return AdvertDetailModel(
      address: address ?? this.address,
      advertTime: advertTime ?? this.advertTime,
      advertType: advertType ?? this.advertType,
      ageOfConstruction: ageOfConstruction ?? this.ageOfConstruction,
      canVideoCall: canVideoCall ?? this.canVideoCall,
      citizenship: citizenship ?? this.citizenship,
      city: city ?? this.city,
      country: country ?? this.country,
      state: state ?? this.state,
      floorInConstruction: floorInConstruction ?? this.floorInConstruction,
      totalFloorInConstruction: totalFloorInConstruction ?? this.totalFloorInConstruction,
      hasFurnitureInHouse: hasFurnitureInHouse ?? this.hasFurnitureInHouse,
      heatingSystem: heatingSystem ?? this.heatingSystem,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      livingArea: livingArea ?? this.livingArea,
      note: note ?? this.note,
      price: price ?? this.price,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      hasGarage: hasGarage ?? this.hasGarage,
      inSite: inSite ?? this.inSite,
      title: title ?? this.title,
      ownerId: ownerId ?? this.ownerId,
      id: id ?? this.id,
    );
  }
}
