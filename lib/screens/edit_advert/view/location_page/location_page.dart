import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:dunya_evim/src/maps/edit_location_huawei_maps.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/buttons/main_elevated_button.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../../src/maps/edit_location_google_maps.dart';
import '../../../auth/login/bloc/login_bloc.dart';
import '../close_edit_advert_button.dart';

part 'location_service_denied_forever.dart';
part 'location_service_denied.dart';
part 'an_error_has_occured.dart';

class EditAdvertEditLocationPage extends StatefulWidget {
  const EditAdvertEditLocationPage({super.key});

  @override
  State<EditAdvertEditLocationPage> createState() => _EditAdvertEditLocationPageState();
}

class _EditAdvertEditLocationPageState extends State<EditAdvertEditLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_chooseLocation.tr()),
        actions: [
          CloseEditAdvertButton(),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.locationPermission != current.locationPermission,
        builder: (context, state) {
          if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.notHuawei) {
            return EditLocationGoogleMaps();
          } else if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.isHuawei) {
            return EditLocationHuaweiMaps();
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
      bottomNavigationBar: BlocBuilder<EditAdvertBloc, EditAdvertState>(
        builder: (context, state) {
          return AddAdvertBottomNavBar(
            leftOnPressed: () async {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertNotePage);
            },
            rightOnPressed: () async {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertPhotoPage);
            },
          );
        },
      ),
    );
  }
}
