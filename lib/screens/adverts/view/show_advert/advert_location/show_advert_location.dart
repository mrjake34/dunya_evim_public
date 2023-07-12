import 'package:dunya_evim/screens/adverts/bloc/advert_bloc.dart';
import 'package:dunya_evim/src/buttons/main_elevated_button.dart';
import 'package:dunya_evim/src/maps/show_location_google_maps.dart';
import 'package:dunya_evim/src/maps/show_location_huawei_maps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/text/body_title.dart';
import '../../../../auth/login/bloc/login_bloc.dart';

part 'location_service_denied.dart';
part 'location_service_denied_forever.dart';
part 'an_error_has_occured.dart';

class ShowAdvertLocation extends StatefulWidget {
  const ShowAdvertLocation({super.key});

  @override
  State<ShowAdvertLocation> createState() => _ShowAdvertLocationState();
}

class _ShowAdvertLocationState extends State<ShowAdvertLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.advert_advertLocation.tr()),
        centerTitle: true,
        leading: IconButton(onPressed: () => NavigationService.instance.navigateToBack(), icon: Icon(Icons.chevron_left_outlined)),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.locationPermission != current.locationPermission,
        builder: (context, state) {
          if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.notHuawei) {
            return BlocBuilder<AdvertBloc, AdvertState>(
              builder: (context, state) {
                return ShowLocationGoogleMaps(
                  latitude: state.advertDetailModel?.latitude,
                  longitude: state.advertDetailModel?.longitude,
                );
              },
            );
          } else if (state.userCurrentPosition != null && state.huaweiEnum == HuaweiEnums.isHuawei) {
            return BlocBuilder<AdvertBloc, AdvertState>(
              builder: (context, state) {
                return ShowLocationHuaweiMaps(
                  latitude: state.advertDetailModel?.latitude,
                  longitude: state.advertDetailModel?.longitude,
                );
              },
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
    );
  }
}
