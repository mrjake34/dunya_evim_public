import 'package:dunya_evim/src/maps/add_location_google_maps.dart';
import 'package:dunya_evim/src/maps/add_location_huawei_maps.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/buttons/main_elevated_button.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../auth/login/bloc/login_bloc.dart';
import '../../bloc/add_advert_bloc.dart';
import '../close_add_advert_button.dart';

part 'location_service_denied_forever.dart';
part 'location_service_denied.dart';
part 'an_error_has_occured.dart';

class AddAdvertAddLocationPage extends StatefulWidget {
  const AddAdvertAddLocationPage({super.key});

  @override
  State<AddAdvertAddLocationPage> createState() => _AddAdvertAddLocationPageState();
}

class _AddAdvertAddLocationPageState extends State<AddAdvertAddLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_chooseLocation.tr()),
        actions: [
          CloseAddAdvertButton(),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.locationPermission != current.locationPermission,
        builder: (context, state) {
          if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.notHuawei) {
            return AddLocationGoogleMaps(
              position: state.userCurrentPosition,
            );
          } else if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.isHuawei) {
            return AddLocationHuaweiMaps(
              position: state.userCurrentPosition,
            );
          } else if (state.huaweiEnum == HuaweiEnums.huaweiButCoreOutdated) {
            return Center(
              child: BodyTitleText(text: LocaleKeys.errors_huaweiCoreOutDated),
            );
          } else if (state.locationPermission == LocationPermission.denied || state.userCurrentPosition != null) {
            return _LocationServiceDenied();
          } else if (state.locationPermission == LocationPermission.deniedForever) {
            return _LocationServiceDeniedForever();
          } else {
            return _AnErrorHasOccured();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<AddAdvertBloc, AddAdvertState>(
        builder: (context, state) {
          return AddAdvertBottomNavBar(
            leftOnPressed: () async {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertNotePage);
            },
            rightOnPressed: () async {
              if (state.longitude != null && state.latitude != null) {
                NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertPhotoPage);
              } else {
                ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_noLocation.tr());
              }
            },
          );
        },
      ),
    );
  }
}
