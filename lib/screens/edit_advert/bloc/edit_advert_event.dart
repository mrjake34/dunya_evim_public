// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_advert_bloc.dart';

abstract class EditAdvertEvent extends Equatable {
  const EditAdvertEvent();

  @override
  List<Object?> get props => [];
}

class FetchAdvertDetailEvent extends EditAdvertEvent {
  final String? docId;

  FetchAdvertDetailEvent({this.docId});
}

class ChangeCurrencyEvent extends EditAdvertEvent {
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

class EditAdvertDetailEvent extends EditAdvertEvent {
  final String? title;
  final String? price;
  final String? livingArea;
  final String? ageOfConstruction;
  final String? floorInConstruction;
  final String? totalFloorInConstruction;
  final String? heatingSystem;

  EditAdvertDetailEvent({
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

class AddAdvertTypeEvent extends EditAdvertEvent {
  final AdvertTypeEnums? advertTypeEnums;

  AddAdvertTypeEvent({this.advertTypeEnums});
  @override
  List<Object?> get props => [advertTypeEnums];
}

class AddFurnitureEvent extends EditAdvertEvent {
  final FurnitureEnums? furnitureEnums;

  AddFurnitureEvent({this.furnitureEnums});
  @override
  List<Object?> get props => [furnitureEnums];
}

class AddHasGarageEvent extends EditAdvertEvent {
  final HasGarageEnums? hasGarageEnums;

  AddHasGarageEvent({this.hasGarageEnums});
  @override
  List<Object?> get props => [hasGarageEnums];
}

class AddInSiteEvent extends EditAdvertEvent {
  final InSiteEnums? inSiteEnums;

  AddInSiteEvent({this.inSiteEnums});
  @override
  List<Object?> get props => [inSiteEnums];
}

class AddCanVideoCallEvent extends EditAdvertEvent {
  final CanVideoCallEnums? canVideoCallEnums;

  AddCanVideoCallEvent({this.canVideoCallEnums});
  @override
  List<Object?> get props => [canVideoCallEnums];
}

class AddCitizenshipRightsEvent extends EditAdvertEvent {
  final CitizenshipRightsEnums? citizenshipRightsEnums;

  AddCitizenshipRightsEvent({this.citizenshipRightsEnums});
  @override
  List<Object?> get props => [citizenshipRightsEnums];
}

class AddNumberOfRoomsEvent extends EditAdvertEvent {
  final String? numberOfRooms;

  AddNumberOfRoomsEvent({this.numberOfRooms});
  @override
  List<Object?> get props => [numberOfRooms];
}

class AddAdvertNoteEvent extends EditAdvertEvent {
  final String? advertNote;

  AddAdvertNoteEvent({this.advertNote});
}

class GetUserCurrentPositionEvent extends EditAdvertEvent {}

class GetAddressFromLatLngEvent extends EditAdvertEvent {
  final double? latitude;
  final double? longitude;

  GetAddressFromLatLngEvent({this.latitude, this.longitude});
}

class AddPhotosFromGalleryEvent extends EditAdvertEvent {}

class AddPhotosFromCameraEvent extends EditAdvertEvent {}

class RemovePhotoEvent extends EditAdvertEvent {
  final int? index;

  RemovePhotoEvent({this.index});
  @override
  List<Object?> get props => [index];
}

class SendAdvertData extends EditAdvertEvent {
  final String? uid;
  final List<XFile>? files;
  final String? userMail;

  SendAdvertData({this.uid, this.files, this.userMail});
  @override
  List<Object?> get props => [uid, files, userMail];
}

class EmergenyExitEvent extends EditAdvertEvent {
  final String? uid;
  final String? docId;

  EmergenyExitEvent({this.uid, this.docId});
}

class DeletePhotoFromStorage extends EditAdvertEvent {
  final int? index;
  DeletePhotoFromStorage({
    this.index,
  });
}
