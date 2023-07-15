import 'package:dunya_evim/core/constants/enums/advert_list_enums.dart';
import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/auth/login/bloc/login_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/navigation/navigation_service.dart';
import '../../../core/utils/snackbar/show_snackbar.dart';
import '../../adverts/view/advert_list/adverts_list.dart';
import '../../../pages/about.dart';
import '../../../pages/advert_list/address_search_advert.dart';
import '../../../pages/advert_list/for_rent_adverts/for_rent_list_page.dart';
import '../../../pages/advert_list/for_sale_adverts/for_sale_advert_list_page.dart';
import '../../../pages/advert_list/title_search_advert.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  Future<void> clearPrefs() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return _PageBuilder();
  }

  goAdvertAddPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ForSaleAdvertList()));
  }
}

final class _PageBuilder extends StatelessWidget {
  const _PageBuilder();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.userCredential != null) {
                  return LoggedInField();
                } else {
                  return LoggedOutField();
                }
              },
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.userCredential != null) {
                return ListTile(
                  title: Text(LocaleKeys.advert_addAdvert.tr()),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
                      NavigationService.instance.navigateToPage(path: RoutersConstants.addAdvertDetailPage);
                    } else {
                      ShowSnackbar.instance.showSnackBar(LocaleKeys.errors_youMustEmailVerifyForAddAdvert.tr());
                    }
                  },
                );
              } else {
                return Container();
              }
            },
          ),
          ListTile(
              title: const Text('Satılık'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ForSaleAdvertList()));
              }),
          ListTile(
              title: const Text('Kiralık'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ForRentAdvertList()));
              }),
          ListTile(
              title: const Text('Tüm İlanlar'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AdvertsList()));
              }),
          ListTile(
              title: const Text('Başlıkta Ara'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TitleSearchAdvert()));
              }),
          ListTile(
              title: const Text('Adres de Ara'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AddressSearchAdvert()));
              }),
          ListTile(
              title: Text(LocaleKeys.countries_usa.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.usa);
              }),
              ListTile(
              title: Text(LocaleKeys.countries_gb.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.greatBritania);
              }),
          ListTile(
              title: Text(LocaleKeys.countries_canada.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.canada);
              }),
          ListTile(
              title: Text(LocaleKeys.countries_germany.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.germany);
              }),
          ListTile(
              title: Text(LocaleKeys.countries_netherlands.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.netherlands);
              }),
          ListTile(
              title:  Text(LocaleKeys.countries_belgium.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.belgium);
              }),
          ListTile(
              title:  Text(LocaleKeys.countries_poland.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.poland);
              }),
          ListTile(
              title:  Text(LocaleKeys.countries_romania.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.romania);
              }),
          ListTile(
              title:  Text(LocaleKeys.countries_france.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.france);
              }),
          ListTile(
              title:  Text(LocaleKeys.countries_italy.tr()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                 NavigationService.instance.navigateToPage(path: RoutersConstants.advertCountriesPage, data: AdvertListCountriesEnums.italy);
              }),
          ListTile(
              title: const Text('Uygulama Hakkında'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutPage()));
              }),
        ],
      ),
    );
  }
}

class LoggedOutField extends StatelessWidget {
  const LoggedOutField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListTile(
            leading: const Icon(Icons.home, size: 25),
            title: Text(
              LocaleKeys.mainText_homepage.tr(),
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
            },
          ),
        ),
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.person,
              size: 25,
            ),
            title: Text(
              'Kayıt Ol',
              style: TextStyle(fontSize: 14),
            ),
            //trailing: const Icon(Icons.arrow_right_sharp, size: 40),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ),
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.login,
              size: 25,
            ),
            title: Text(
              'Giriş Yap',
              style: TextStyle(fontSize: 14),
            ),
            //trailing: const Icon(Icons.arrow_right_sharp, size: 40),
            onTap: () {
              Navigator.pushNamed(context, '/authpage');
            },
          ),
        ),
      ],
    );
  }
}

class LoggedInField extends StatelessWidget {
  const LoggedInField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text('Hoşgeldiniz \n ${FirebaseAuth.instance.currentUser!.displayName}'),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: const Icon(Icons.home, size: 25),
            title: Text(
              LocaleKeys.mainText_homepage.tr(),
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              size: 25,
            ),
            title: Text(
              'Çıkış Yap',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ],
    );
  }
}
