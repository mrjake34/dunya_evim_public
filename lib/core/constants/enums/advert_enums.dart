import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';

enum AdvertTypeEnums {
  forSellApartment(LocaleKeys.advertList_advertTypes_forSellApartment),
  forSellVilla(LocaleKeys.advertList_advertTypes_forSellVilla),
  forSellResidence(LocaleKeys.advertList_advertTypes_forSellResidence),
  forSellDetachedHouse(LocaleKeys.advertList_advertTypes_forSellDetachedHouse),
  forSellFarmhouse(LocaleKeys.advertList_advertTypes_forSellFarmhouse),
  forSellMansion(LocaleKeys.advertList_advertTypes_forSellMansion),
  forSellSeasideHouse(LocaleKeys.advertList_advertTypes_forSellSeasideHouse),
  forSellSeasideApartment(LocaleKeys.advertList_advertTypes_forSellSeasideApartment),
  forSellSummerHouse(LocaleKeys.advertList_advertTypes_forSellSummerHouse),
  forSellPrefabHouse(LocaleKeys.advertList_advertTypes_forSellPrefabHouse),
  forRentApartment(LocaleKeys.advertList_advertTypes_forRentApartment),
  forRentVilla(LocaleKeys.advertList_advertTypes_forRentVilla),
  forRentResidence(LocaleKeys.advertList_advertTypes_forRentResidence),
  forRentDetachedHouse(LocaleKeys.advertList_advertTypes_forRentDetachedHouse),
  forRentFarmhouse(LocaleKeys.advertList_advertTypes_forRentFarmhouse),
  forRentMansion(LocaleKeys.advertList_advertTypes_forRentMansion),
  forRentSeasideHouse(LocaleKeys.advertList_advertTypes_forRentSeasideHouse),
  forRentSeasideApartment(LocaleKeys.advertList_advertTypes_forRentSeasideApartment),
  forRentSummerHouse(LocaleKeys.advertList_advertTypes_forRentSummerHouse),
  forRentPrefabHouse(LocaleKeys.advertList_advertTypes_forRentPrefabHouse);

  final String value;

  const AdvertTypeEnums(this.value);

  @override
  String toString() => value;
}

enum FurnitureEnums {
  furnitured(LocaleKeys.advertList_furniture_furnitured),
  unFurniture(LocaleKeys.advertList_furniture_unFurniture),
  brandNewFurniture(LocaleKeys.advertList_furniture_brandNewFurniture),
  furnishedAndKitchenAppliances(LocaleKeys.advertList_furniture_furnishedAndKitchenAppliances),
  onlyFurniture(LocaleKeys.advertList_furniture_onlyFurniture),
  allHouseItems(LocaleKeys.advertList_furniture_allHouseItems),
  partlyFurnished(LocaleKeys.advertList_furniture_partlyFurnished);

  final String value;

  const FurnitureEnums(this.value);

  @override
  String toString() => value;
}

enum HasGarageEnums {
  available(LocaleKeys.advertList_hasGarage_hasGarageYes),
  no(LocaleKeys.advertList_hasGarage_hasGarageNo);

  final String value;

  const HasGarageEnums(this.value);

  @override
  String toString() => value;
}

enum InSiteEnums {
  yes(LocaleKeys.advertList_inSite_inSiteYes),
  no(LocaleKeys.advertList_inSite_inSiteNo);

  final String value;

  const InSiteEnums(this.value);

  @override
  String toString() => value;
}

enum CanVideoCallEnums {
  possible(LocaleKeys.advertList_canVideoCall_canVideoCallPossible),
  notPossible(LocaleKeys.advertList_canVideoCall_canVideoCallNotPossible),
  spesificTimes(LocaleKeys.advertList_canVideoCall_canVideoCallSpecificTimes);

  final String value;

  const CanVideoCallEnums(this.value);

  @override
  String toString() => value;
}

enum CitizenshipRightsEnums {
  yes(LocaleKeys.advertList_citizenshipRights_citizenshipRightsYes),
  no(LocaleKeys.advertList_citizenshipRights_citizenshipRightsNo),
  certainConditions(LocaleKeys.advertList_citizenshipRights_citizenshipRightsCertainConditions);

  final String value;

  const CitizenshipRightsEnums(this.value);

  @override
  String toString() => value;
}
