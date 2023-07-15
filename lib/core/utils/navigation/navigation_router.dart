import 'package:dunya_evim/core/constants/enums/advert_list_enums.dart';
import 'package:dunya_evim/screens/adverts/view/show_advert/advert_detail/advert_owner_field/owner_profile.dart';
import 'package:dunya_evim/screens/profile/model/user_model.dart';
import 'package:dunya_evim/screens/profile/view/verify_email_page.dart';
import 'package:dunya_evim/src/maps/add_location_google_maps.dart';
import 'package:dunya_evim/src/maps/add_location_huawei_maps.dart';
import 'package:dunya_evim/src/maps/show_location_google_maps.dart';
import 'package:flutter/material.dart';
import '../../../screens/add_advert/view/detail_page/detail_page.dart';
import '../../../screens/add_advert/view/location_page/location_page.dart';
import '../../../screens/add_advert/view/note_page/note_page.dart';
import '../../../screens/add_advert/view/photo_page/photo_page.dart';
import '../../../screens/add_advert/view/review_page/review_location/review_location.dart';
import '../../../screens/add_advert/view/review_page/review_note/review_note.dart';
import '../../../screens/add_advert/view/review_page/review_page.dart';
import '../../../screens/advert_list_countries/view/advert_countries.dart';
import '../../../screens/adverts/view/show_advert/show_advert.dart';
import '../../../screens/auth/forget_password/pass_reset.dart';
import '../../../screens/auth/login/view/login_page.dart';
import '../../../screens/auth/register/view/register_page.dart';
import '../../../home.dart';
import '../../../screens/edit_advert/view/detail_page/detail_page.dart';
import '../../../screens/edit_advert/view/location_page/location_page.dart';
import '../../../screens/edit_advert/view/note_page/note_page.dart';
import '../../../screens/edit_advert/view/photo_page/photo_page.dart';
import '../../../screens/not_found_page/not_found_page.dart';
import '../../../src/maps/show_location_huawei_maps.dart';
import '../../constants/routers/routers.dart';

final class NavigationRouter {
  NavigationRouter._init();
  static final NavigationRouter _instance = NavigationRouter._init();
  static NavigationRouter get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Home
      case RoutersConstants.home:
        return normalNavigate(HomePage(), RoutersConstants.home);
      //Auth
      case RoutersConstants.loginPage:
        return normalNavigate(LoginPage(), RoutersConstants.loginPage);
      case RoutersConstants.registerPage:
        return normalNavigate(RegisterPage(), RoutersConstants.registerPage);
      case RoutersConstants.passReset:
        return normalNavigate(PassReset(), RoutersConstants.passReset);
      //Adverts
      case RoutersConstants.showAdvertPage:
        return normalNavigate(
            ShowAdvert(
              docId: settings.arguments.toString(),
            ),
            RoutersConstants.showAdvertPage);
      case RoutersConstants.advertOwnerProfilePage:
        return normalNavigate(
            OwnerProfilePage(
              advertOwnerModel: settings.arguments as UserModel,
            ),
            RoutersConstants.advertOwnerProfilePage);
      case RoutersConstants.advertCountriesPage:
        return normalNavigate(
            AdvertCountriesPage(
              advertListCountries: settings.arguments as AdvertListCountriesEnums,
            ),
            RoutersConstants.advertCountriesPage);

      //Add Advert
      case RoutersConstants.addAdvertDetailPage:
        return normalNavigate(AddAdvertAddDetailPage(), RoutersConstants.addAdvertDetailPage);
      case RoutersConstants.addAdvertNotePage:
        return normalNavigate(AddAdvertAddNotePage(), RoutersConstants.addAdvertNotePage);
      case RoutersConstants.addAdvertLocationPage:
        return normalNavigate(AddAdvertAddLocationPage(), RoutersConstants.addAdvertLocationPage);
      case RoutersConstants.addAdvertPhotoPage:
        return normalNavigate(AddAdvertAddPhotoPage(), RoutersConstants.addAdvertPhotoPage);

      case RoutersConstants.addAdvertReviewPage:
        return normalNavigate(AddAdvertReviewPage(), RoutersConstants.addAdvertReviewPage);
      case RoutersConstants.addAdvertReviewDetailPage:
        return normalNavigate(AddAdvertAddDetailPage(), RoutersConstants.addAdvertReviewDetailPage);
      case RoutersConstants.addAdvertReviewNotePage:
        return normalNavigate(AddAdvertReviewNotePage(), RoutersConstants.addAdvertReviewNotePage);
      case RoutersConstants.addAdvertReviewLocationPage:
        return normalNavigate(AddAdvertReviewLocationPage(), RoutersConstants.addAdvertReviewLocationPage);
      case RoutersConstants.addAdvertReviewLocationHuaweiPage:
        return normalNavigate(ShowLocationHuaweiMaps(), RoutersConstants.addAdvertReviewLocationHuaweiPage);
      //Edit Advert
      case RoutersConstants.editAdvertDetailPage:
        return normalNavigate(EditAdvertEditDetailPage(), RoutersConstants.editAdvertDetailPage);
      case RoutersConstants.editAdvertNotePage:
        return normalNavigate(EditAdvertEditNotePage(), RoutersConstants.editAdvertNotePage);
      case RoutersConstants.editAdvertLocationPage:
        return normalNavigate(EditAdvertEditLocationPage(), RoutersConstants.editAdvertLocationPage);
      case RoutersConstants.editAdvertPhotoPage:
        return normalNavigate(EditAdvertEditPhotoPage(), RoutersConstants.editAdvertPhotoPage);

      //Maps
      case RoutersConstants.addLocationHuaweiMaps:
        return normalNavigate(AddLocationHuaweiMaps(), RoutersConstants.addLocationHuaweiMaps);
      case RoutersConstants.addLocationGoogleMaps:
        return normalNavigate(AddLocationGoogleMaps(), RoutersConstants.addLocationGoogleMaps);
      case RoutersConstants.showLocationHuaweiMaps:
        return normalNavigate(ShowLocationGoogleMaps(), RoutersConstants.showLocationHuaweiMaps);
      case RoutersConstants.showLocationGoogleMaps:
        return normalNavigate(ShowLocationGoogleMaps(), RoutersConstants.showLocationGoogleMaps);

      //Profile
      case RoutersConstants.reSendVerifyEmailPage:
        return normalNavigate(VerifyEmailPage(), RoutersConstants.reSendVerifyEmailPage);

      default:
        return normalNavigate(NotFoundPage(), RoutersConstants.notFoundPage);
    }
  }

  MaterialPageRoute<dynamic> normalNavigate(Widget widget, String pageName, {Object? data}) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName, arguments: data));
  }
}
