part of 'add_advert_bloc.dart';

@immutable
class AddAdvertState extends Equatable {
  const AddAdvertState({
    this.status,
    this.currencyTextInputFormatter,
    this.currencyIcon,
    this.advertTypeEnums,
    this.hasGarageEnums,
    this.citizenshipRightsEnums,
    this.canVideoCallEnums,
    this.inSiteEnums,
    this.furnitureEnums,
    this.numberOfRooms,
    this.address,
    this.ageOfConstruction,
    this.city,
    this.country,
    this.countryCode,
    this.state,
    this.floorInConstruction,
    this.totalFloorInConstruction,
    this.heatingSystem,
    this.latitude,
    this.longitude,
    this.livingArea,
    this.note,
    this.price,
    this.title,
    this.docId,
    this.userCurrentPosition,
    this.files,
    this.photosUrlList,
    this.uploadTask,
    this.photoUrlUploaded,
    this.advertDatasUploaded,
  });
  final Status? status;
  final CurrencyTextInputFormatter? currencyTextInputFormatter;
  final Icon? currencyIcon;
  final AdvertTypeEnums? advertTypeEnums;
  final HasGarageEnums? hasGarageEnums;
  final CitizenshipRightsEnums? citizenshipRightsEnums;
  final CanVideoCallEnums? canVideoCallEnums;
  final InSiteEnums? inSiteEnums;
  final FurnitureEnums? furnitureEnums;
  final String? numberOfRooms;
  final String? address;
  final String? ageOfConstruction;
  final String? city;
  final String? country;
  final String? countryCode;
  final String? state;
  final String? floorInConstruction;
  final String? totalFloorInConstruction;
  final String? heatingSystem;
  final double? latitude;
  final double? longitude;
  final String? livingArea;
  final String? note;
  final String? price;
  final String? title;
  final String? docId;
  final Position? userCurrentPosition;
  final List<XFile>? files;
  final List<String>? photosUrlList;
  final UploadTask? uploadTask;
  final Status? photoUrlUploaded;
  final Status? advertDatasUploaded;
  @override
  List<Object?> get props => [
        status,
        currencyTextInputFormatter,
        currencyIcon,
        advertTypeEnums,
        hasGarageEnums,
        citizenshipRightsEnums,
        canVideoCallEnums,
        inSiteEnums,
        furnitureEnums,
        numberOfRooms,
        address,
        ageOfConstruction,
        city,
        country,
        countryCode,
        state,
        floorInConstruction,
        totalFloorInConstruction,
        heatingSystem,
        latitude,
        longitude,
        livingArea,
        note,
        price,
        title,
        docId,
        userCurrentPosition,
        files,
        photosUrlList,
        uploadTask,
        photoUrlUploaded,
        advertDatasUploaded,
      ];

  AddAdvertState copyWith({
    Status? status,
    CurrencyTextInputFormatter? currencyTextInputFormatter,
    Icon? currencyIcon,
    AdvertTypeEnums? advertTypeEnums,
    HasGarageEnums? hasGarageEnums,
    CitizenshipRightsEnums? citizenshipRightsEnums,
    CanVideoCallEnums? canVideoCallEnums,
    InSiteEnums? inSiteEnums,
    FurnitureEnums? furnitureEnums,
    String? numberOfRooms,
    String? address,
    String? ageOfConstruction,
    String? city,
    String? country,
    String? countryCode,
    String? state,
    String? floorInConstruction,
    String? totalFloorInConstruction,
    String? heatingSystem,
    double? latitude,
    double? longitude,
    String? livingArea,
    String? note,
    String? price,
    String? title,
    String? docId,
    Position? userCurrentPosition,
    List<XFile>? files,
    List<String>? photosUrlList,
    UploadTask? uploadTask,
    Status? photoUrlUploaded,
    Status? advertDatasUploaded,
  }) {
    return AddAdvertState(
      status: status ?? this.status,
      currencyTextInputFormatter: currencyTextInputFormatter ?? this.currencyTextInputFormatter,
      currencyIcon: currencyIcon ?? this.currencyIcon,
      advertTypeEnums: advertTypeEnums ?? this.advertTypeEnums,
      hasGarageEnums: hasGarageEnums ?? this.hasGarageEnums,
      citizenshipRightsEnums: citizenshipRightsEnums ?? this.citizenshipRightsEnums,
      canVideoCallEnums: canVideoCallEnums ?? this.canVideoCallEnums,
      inSiteEnums: inSiteEnums ?? this.inSiteEnums,
      furnitureEnums: furnitureEnums ?? this.furnitureEnums,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      address: address ?? this.address,
      ageOfConstruction: ageOfConstruction ?? this.ageOfConstruction,
      city: city ?? this.city,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      state: state ?? this.state,
      floorInConstruction: floorInConstruction ?? this.floorInConstruction,
      totalFloorInConstruction: totalFloorInConstruction ?? this.totalFloorInConstruction,
      heatingSystem: heatingSystem ?? this.heatingSystem,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      livingArea: livingArea ?? this.livingArea,
      note: note ?? this.note,
      price: price ?? this.price,
      title: title ?? this.title,
      docId: docId ?? this.docId,
      userCurrentPosition: userCurrentPosition ?? this.userCurrentPosition,
      files: files ?? this.files,
      photosUrlList: photosUrlList ?? this.photosUrlList,
      uploadTask: uploadTask ?? this.uploadTask,
      photoUrlUploaded: photoUrlUploaded ?? this.photoUrlUploaded,
      advertDatasUploaded: advertDatasUploaded ?? this.advertDatasUploaded,
    );
  }
}
final class AddAdvertInitial extends AddAdvertState {
  @override
  List<Object?> get props => [];
}
