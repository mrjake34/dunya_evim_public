import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/src/maps/show_location_google_maps.dart';
import 'package:dunya_evim/src/maps/show_location_huawei_maps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../src/text/body_title.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../src/buttons/main_elevated_button.dart';
import '../../../../auth/login/bloc/login_bloc.dart';
import '../../../bloc/add_advert_bloc.dart';
import '../../close_add_advert_button.dart';

part 'an_error_has_occured.dart';

class AddAdvertReviewLocationPage extends StatelessWidget {
  const AddAdvertReviewLocationPage({super.key});

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
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.locationPermission != current.locationPermission,
        builder: (context, state) {
          if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.notHuawei) {
            return BlocBuilder<AddAdvertBloc, AddAdvertState>(
              builder: (context, state) {
                return ShowLocationGoogleMaps(
                  latitude: state.latitude,
                  longitude: state.longitude,
                );
              },
            );
          } else if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.isHuawei) {
            return BlocBuilder<AddAdvertBloc, AddAdvertState>(
              builder: (context, state) {
                return ShowLocationHuaweiMaps(
                  latitude: state.latitude,
                  longitude: state.longitude,
                );
              },
            );
          } else if (state.huaweiEnum == HuaweiEnums.huaweiButCoreOutdated) {
            return Center(
              child: BodyTitleText(text: LocaleKeys.errors_huaweiCoreOutDated),
            );
          } else {
            return _AnErrorHasOccured();
          }
        },
      ),
    );
  }
}
