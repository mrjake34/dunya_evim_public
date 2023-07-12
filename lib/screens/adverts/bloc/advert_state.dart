
part of 'advert_bloc.dart';

final class AdvertState extends Equatable {
  AdvertState({
    this.advertList,
    this.advertDetailModel,
    this.advertOwnerModel,
    this.imageList,
    this.status,

  });
  final List<QueryDocumentSnapshot<AdvertModel?>>? advertList;
  final AdvertDetailModel? advertDetailModel;
  final UserModel? advertOwnerModel;
  final List<dynamic>? imageList;
  final Status? status;


  @override
  List<Object?> get props => [
      advertList,
      advertDetailModel,
      advertOwnerModel,
      imageList,
      status,
 
    ];

  AdvertState copyWith({
    List<QueryDocumentSnapshot<AdvertModel?>>? advertList,
    AdvertDetailModel? advertDetailModel,
    UserModel? advertOwnerModel,
    List<dynamic>? imageList,
    Status? status,
    CurrencyTextInputFormatter? currencyTextInputFormatter,
    Icon? currencyIcon,
    AdvertDetailModel? addNewAdvert,
  }) {
    return AdvertState(
      advertList: advertList ?? this.advertList,
      advertDetailModel: advertDetailModel ?? this.advertDetailModel,
      advertOwnerModel: advertOwnerModel ?? this.advertOwnerModel,
      imageList: imageList ?? this.imageList,
      status: status ?? this.status,
    );
  }
}

