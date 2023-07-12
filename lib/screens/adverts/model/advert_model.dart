// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advert_model.g.dart';

@JsonSerializable()
class AdvertModel extends Equatable {
  AdvertModel({
    this.title,
    this.price,
    this.address,
    this.smallImageUrl,
    this.docId,
    this.category,
    this.country,
    this.advertType,
    this.advertTime,
    this.hasMessage,
    this.adminMessage,
    this.homeSlider,
    this.approved,
    this.ownerMail,
    this.ownerUid,
    this.stoppedByOwner,
  });

  final String? title;
  final String? price;
  final String? address;
  final String? smallImageUrl;
  final String? docId;
  final String? category;
  final String? country;
  final String? advertType;
  final String? advertTime;
  final bool? hasMessage;
  final String? adminMessage;
  final bool? homeSlider;
  final bool? approved;
  final String? ownerMail;
  final String? ownerUid;
  final bool? stoppedByOwner;

  @override
  List<Object?> get props {
    return [
      title,
      price,
      address,
      smallImageUrl,
      docId,
      category,
      country,
      advertType,
      advertTime,
      hasMessage,
      adminMessage,
      homeSlider,
      approved,
      ownerMail,
      ownerUid,
      stoppedByOwner,
    ];
  }

  Map<String, dynamic> toJson() => _$AdvertModelToJson(this);

  factory AdvertModel.fromJson(Map<String, dynamic> json) => _$AdvertModelFromJson(json);

  AdvertModel copyWith({
    String? title,
    String? price,
    String? address,
    String? smallImageUrl,
    String? docId,
    String? category,
    String? country,
    String? advertType,
    String? advertTime,
    bool? hasMessage,
    String? adminMessage,
    bool? homeSlider,
    bool? approved,
    String? ownerMail,
    String? ownerUid,
    bool? stoppedByOwner,
  }) {
    return AdvertModel(
      title: title ?? this.title,
      price: price ?? this.price,
      address: address ?? this.address,
      smallImageUrl: smallImageUrl ?? this.smallImageUrl,
      docId: docId ?? this.docId,
      category: category ?? this.category,
      country: country ?? this.country,
      advertType: advertType ?? this.advertType,
      advertTime: advertTime ?? this.advertTime,
      hasMessage: hasMessage ?? this.hasMessage,
      adminMessage: adminMessage ?? this.adminMessage,
      homeSlider: homeSlider ?? this.homeSlider,
      approved: approved ?? this.approved,
      ownerMail: ownerMail ?? this.ownerMail,
      ownerUid: ownerUid ?? this.ownerUid,
      stoppedByOwner: stoppedByOwner ?? this.stoppedByOwner,
    );
  }
}
