import 'package:carousel_slider/carousel_slider.dart';
import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../profile/bloc/profile_bloc.dart';
import '../../../../profile/model/user_model.dart';
import '../../../bloc/advert_bloc.dart';

part 'detail_view_fields/advert_address_field.dart';
part 'detail_view_fields/advert_age_of_contruction_field.dart';
part 'detail_view_fields/advert_area_field.dart';
part 'detail_view_fields/advert_can_video_call_field.dart';
part 'detail_view_fields/advert_citizenship_field.dart';
part 'advert_owner_field/advert_contact_field.dart';
part 'detail_view_fields/advert_floor_in_contruction_field.dart';
part 'detail_view_fields/advert_has_furniture_field.dart';
part 'detail_view_fields/advert_has_garage_field.dart';
part 'detail_view_fields/advert_heating_system_field.dart';
part 'detail_view_fields/advert_in_site_field.dart';
part 'detail_view_fields/advert_living_area_field.dart';
part 'detail_view_fields/advert_number_of_rooms_field.dart';
part 'advert_owner_field/advert_owner_name_field.dart';
part 'detail_view_fields/advert_price_field.dart';
part 'detail_view_fields/advert_time_field.dart';
part 'detail_view_fields/advert_title_field.dart';
part 'detail_view_fields/advert_type_field.dart';
part 'full_screen_bottom_sheet.dart';

class DetailBuilder extends StatelessWidget {
  const DetailBuilder({super.key, required this.docId});
  final String docId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertBloc, AdvertState>(
      builder: (context, state) {
        final data = state.advertDetailModel;
        return Column(
          children: [
            AdvertTitleField(title: data?.title),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertTimeField(advertTime: data?.advertTime),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertPriceField(price: data?.price),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertTypeField(advertType: data?.advertType),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertAreaField(
              state: data?.state,
              country: data?.country,
            ),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertAddressField(address: data?.address),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertFloorInConstructionField(
              floorInConstruction: data?.floorInConstruction,
              totalFloorInConstruction: data?.totalFloorInConstruction,
            ),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertNumberOfRoomsField(numberOfRooms: data?.numberOfRooms),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertAgeOfConstructionField(ageOfConstruction: data?.ageOfConstruction),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertLivingAreaField(livingArea: data?.livingArea),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertHeatingSystemField(heatingSystem: data?.heatingSystem),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertHasGarageField(hasGarage: data?.hasGarage),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertHasFurnitureField(furnitureStatus: data?.hasFurnitureInHouse),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertInSiteField(inSite: data?.inSite),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertCanVideoCallField(canVideoCall: data?.canVideoCall),
            Divider(
              thickness: 2,
              height: 2,
            ),
            AdvertCitizenshipField(citizenship: data?.citizenship),
            Divider(
              thickness: 2,
              height: 2,
            ),
          ],
        );
      },
    );
  }
}
