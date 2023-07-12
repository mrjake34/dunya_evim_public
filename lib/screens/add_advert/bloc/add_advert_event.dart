// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_advert_bloc.dart';

abstract class AddAdvertEvent extends Equatable {
  const AddAdvertEvent();

  @override
  List<Object?> get props => [];
}

class ChangeCurrencyEvent extends AddAdvertEvent {
  final CurrencyTextInputFormatter? currencyTextInputFormatter;
  final Icon? currencyIcon;
  final String? price;
  ChangeCurrencyEvent({this.currencyTextInputFormatter, this.currencyIcon, this.price});
  @override
  List<Object?> get props => [currencyTextInputFormatter, currencyIcon, price];

  ChangeCurrencyEvent copyWith({
    CurrencyTextInputFormatter? currencyTextInputFormatter,
    Icon? currencyIcon,
    String? price,
  }) {
    return ChangeCurrencyEvent(
      currencyTextInputFormatter: currencyTextInputFormatter ?? this.currencyTextInputFormatter,
      currencyIcon: currencyIcon ?? this.currencyIcon,
      price: price ?? this.price,
    );
  }
}

class AddNewAdvertDetailEvent extends AddAdvertEvent {
  final String? title;
  final String? price;
  final String? livingArea;
  final String? ageOfConstruction;
  final String? floorInConstruction;
  final String? totalFloorInConstruction;
  final String? heatingSystem;

  AddNewAdvertDetailEvent({
    this.title,
    this.price,
    this.livingArea,
    this.ageOfConstruction,
    this.floorInConstruction,
    this.totalFloorInConstruction,
    this.heatingSystem,
  });
  @override
  List<Object?> get props => [
        title,
        price,
        livingArea,
        ageOfConstruction,
        floorInConstruction,
        totalFloorInConstruction,
        heatingSystem,
      ];
}

class AddAdvertTypeEvent extends AddAdvertEvent {
  final AdvertTypeEnums? advertTypeEnums;

  AddAdvertTypeEvent({this.advertTypeEnums});
  @override
  List<Object?> get props => [advertTypeEnums];
}

class AddFurnitureEvent extends AddAdvertEvent {
  final FurnitureEnums? furnitureEnums;

  AddFurnitureEvent({this.furnitureEnums});
  @override
  List<Object?> get props => [furnitureEnums];
}

class AddHasGarageEvent extends AddAdvertEvent {
  final HasGarageEnums? hasGarageEnums;

  AddHasGarageEvent({this.hasGarageEnums});
  @override
  List<Object?> get props => [hasGarageEnums];
}

class AddInSiteEvent extends AddAdvertEvent {
  final InSiteEnums? inSiteEnums;

  AddInSiteEvent({this.inSiteEnums});
  @override
  List<Object?> get props => [inSiteEnums];
}

class AddCanVideoCallEvent extends AddAdvertEvent {
  final CanVideoCallEnums? canVideoCallEnums;

  AddCanVideoCallEvent({this.canVideoCallEnums});
  @override
  List<Object?> get props => [canVideoCallEnums];
}

class AddCitizenshipRightsEvent extends AddAdvertEvent {
  final CitizenshipRightsEnums? citizenshipRightsEnums;

  AddCitizenshipRightsEvent({this.citizenshipRightsEnums});
  @override
  List<Object?> get props => [citizenshipRightsEnums];
}

class AddNumberOfRoomsEvent extends AddAdvertEvent {
  final String? numberOfRooms;

  AddNumberOfRoomsEvent({this.numberOfRooms});
  @override
  List<Object?> get props => [numberOfRooms];
}

class AddAdvertNoteEvent extends AddAdvertEvent {
  final String? advertNote;

  AddAdvertNoteEvent({this.advertNote});
}

class GetUserCurrentPositionEvent extends AddAdvertEvent {}

class GetAddressFromLatLngEvent extends AddAdvertEvent {
  final double? latitude;
  final double? longitude;

  GetAddressFromLatLngEvent({this.latitude, this.longitude});
}

class AddPhotosFromGalleryEvent extends AddAdvertEvent {}

class AddPhotosFromCameraEvent extends AddAdvertEvent {}

class RemovePhotoEvent extends AddAdvertEvent {
  final int? index;

  RemovePhotoEvent({this.index});
  @override
  List<Object?> get props => [index];
}

class SendAdvertData extends AddAdvertEvent {
  final String? uid;
  final List<XFile>? files;
  final String? userMail;

  SendAdvertData({this.uid, this.files, this.userMail});
  @override
  List<Object?> get props => [uid, files, userMail];
}

class EmergenyExitEvent extends AddAdvertEvent {
  final String? uid;
  final String? docId;

  EmergenyExitEvent({this.uid, this.docId});
}

class ClearBlocEvent extends AddAdvertEvent {}
