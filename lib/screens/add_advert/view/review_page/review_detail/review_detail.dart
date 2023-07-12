import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/utils/navigation/navigation_service.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../adverts/view/show_advert/advert_detail/detail_builder.dart';
import '../../../bloc/add_advert_bloc.dart';
import '../../close_add_advert_button.dart';
import 'slider/review_slider_builder.dart';

part 'slider/review_slider_field.dart';

class AddAdvertReviewDetailPage extends StatefulWidget {
  const AddAdvertReviewDetailPage({Key? key}) : super(key: key);

  @override
  State<AddAdvertReviewDetailPage> createState() => _AddAdvertReviewDetailPageState();
}

class _AddAdvertReviewDetailPageState extends State<AddAdvertReviewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.advert_advertDetail.tr(),
        ),
        leading: IconButton(
          onPressed: () => NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertPhotoPage),
          icon: Icon(Icons.chevron_left),
        ),
        actions: [
          CloseAddAdvertButton(),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReviewSliderField(),
            Divider(
              thickness: 2,
              height: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return AdvertOwnerNameField(
                  advertOwnerModel: state.userModel,
                );
              },
            ),
            BlocBuilder<AddAdvertBloc, AddAdvertState>(
              builder: (context, state) {
                return Column(
                  children: [
                    AdvertContactField(),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertTitleField(
                      title: state.title,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertTimeField(advertTime: DateTime.now().toString()),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertPriceField(price: state.price),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertTypeField(advertType: state.advertTypeEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertAreaField(
                      country: state.country,
                      state: state.state,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertAddressField(address: state.address),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertFloorInConstructionField(
                        floorInConstruction: state.floorInConstruction, totalFloorInConstruction: state.totalFloorInConstruction),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertNumberOfRoomsField(numberOfRooms: state.numberOfRooms),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertAgeOfConstructionField(ageOfConstruction: state.ageOfConstruction),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertLivingAreaField(livingArea: state.livingArea),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertHeatingSystemField(heatingSystem: state.heatingSystem),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertHasGarageField(hasGarage: state.hasGarageEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertHasFurnitureField(furnitureStatus: state.furnitureEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertInSiteField(inSite: state.inSiteEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertCanVideoCallField(canVideoCall: state.canVideoCallEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                    AdvertCitizenshipField(citizenship: state.citizenshipRightsEnums?.value),
                    Divider(
                      thickness: 2,
                      height: 2,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
