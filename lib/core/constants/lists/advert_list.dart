import 'package:dunya_evim/core/constants/enums/advert_enums.dart';

class AdvertList {
  AdvertList._();

  static const List<AdvertTypeEnums> advertTypeEnumList = [
    AdvertTypeEnums.forSellApartment,
    AdvertTypeEnums.forSellVilla,
    AdvertTypeEnums.forSellResidence,
    AdvertTypeEnums.forSellDetachedHouse,
    AdvertTypeEnums.forSellFarmhouse,
    AdvertTypeEnums.forSellMansion,
    AdvertTypeEnums.forSellSeasideHouse,
    AdvertTypeEnums.forSellSeasideApartment,
    AdvertTypeEnums.forSellSummerHouse,
    AdvertTypeEnums.forSellPrefabHouse,
    AdvertTypeEnums.forRentApartment,
    AdvertTypeEnums.forRentVilla,
    AdvertTypeEnums.forRentResidence,
    AdvertTypeEnums.forRentDetachedHouse,
    AdvertTypeEnums.forRentFarmhouse,
    AdvertTypeEnums.forRentMansion,
    AdvertTypeEnums.forRentSeasideHouse,
    AdvertTypeEnums.forRentSeasideApartment,
    AdvertTypeEnums.forRentSummerHouse,
    AdvertTypeEnums.forRentPrefabHouse,
  ];

  static const List<FurnitureEnums> furnitureEnumList = [
    FurnitureEnums.furnitured,
    FurnitureEnums.unFurniture,
    FurnitureEnums.brandNewFurniture,
    FurnitureEnums.furnishedAndKitchenAppliances,
    FurnitureEnums.onlyFurniture,
    FurnitureEnums.allHouseItems,
    FurnitureEnums.partlyFurnished
  ];
  static const List<HasGarageEnums> hasGarageEnumList = [
    HasGarageEnums.available,
    HasGarageEnums.no,
  ];
  static const List<InSiteEnums> inSiteEnumList = [
    InSiteEnums.yes,
    InSiteEnums.no,
  ];
  static const List<CanVideoCallEnums> canVideoCallEnumList = [
    CanVideoCallEnums.possible,
    CanVideoCallEnums.notPossible,
    CanVideoCallEnums.spesificTimes,
  ];
  static const List<CitizenshipRightsEnums> citizenshipRightsEnumList = [
    CitizenshipRightsEnums.yes,
    CitizenshipRightsEnums.no,
    CitizenshipRightsEnums.certainConditions,
  ];

  static const List<String> numberOfRooms = [
    '1+0',
    '1+1',
    '1+2',
    '2+0',
    '2+1',
    '2+2',
    '3+0',
    '3+1',
    '3+2',
    '3+3',
    '4+1',
    '4+2',
    '4+3',
    '4+4',
    '5+1',
    '5+2',
    '5+3',
    '6+1',
    '6+2',
    '6+3',
    '7+',
  ];
}
