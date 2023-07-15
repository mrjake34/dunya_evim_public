part of 'advert_bloc.dart';

class AdvertState extends Equatable {
  AdvertState({
    this.advertList,
    this.advertDetailModel,
    this.advertOwnerModel,
    this.imageList,
    this.status,
    this.sliderIndex,
  });
  final List<AdvertModel>? advertList;
  final AdvertDetailModel? advertDetailModel;
  final UserModel? advertOwnerModel;
  final List<dynamic>? imageList;
  final Status? status;
  final int? sliderIndex;

  @override
  List<Object?> get props {
    return [
      advertList,
      advertDetailModel,
      advertOwnerModel,
      imageList,
      status,
      sliderIndex,
    ];
  }

  AdvertState copyWith({
    List<AdvertModel>? advertList,
    AdvertDetailModel? advertDetailModel,
    UserModel? advertOwnerModel,
    List<dynamic>? imageList,
    Status? status,
    int? sliderIndex,
  }) {
    return AdvertState(
      advertList: advertList ?? this.advertList,
      advertDetailModel: advertDetailModel ?? this.advertDetailModel,
      advertOwnerModel: advertOwnerModel ?? this.advertOwnerModel,
      imageList: imageList ?? this.imageList,
      status: status ?? this.status,
      sliderIndex: sliderIndex ?? this.sliderIndex,
    );
  }
}
