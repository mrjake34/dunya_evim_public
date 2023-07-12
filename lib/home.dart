import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/routers/routers.dart';
import 'core/utils/navigation/navigation_service.dart';
import 'core/utils/translation/locale_keys.g.dart';
import 'screens/auth/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'pages/advert_list/title_search_advert.dart';
import 'pages/drawerpage.dart';
import 'screens/my_adverts/view/my_advert_list.dart';
import 'pages/my_profile_page/my_favorite_list/my_favorite_list_page.dart';
import 'screens/home_page/view/home_page_view.dart';
import 'screens/profile/view/profile_page.dart';

part 'home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  // Future updateDocs() async {
  //   await db.collection('adverts').where('onay', isEqualTo: true).get().then((value) {
  //     docList = value.docs;
  //   });
  // }

  // Future listenDocs() async {
  //   await updateDocs();
  //   db.collection('adverts').where('onay', isEqualTo: true).snapshots().asBroadcastStream().listen((event) {
  //     if (event.docs.length > docList.length) {
  //       LocalNotificationService.localNotification
  //           .show(0, 'İlanınız yayınlandı', 'İlanınızı kontrol etmek için bu bildirime tıklayabilirsiniz.',
  //               LocalNotificationService().notificationDetails2)
  //           .whenComplete(() => updateDocs());
  //     }
  //   });
  // }

  void addDoc() {
    // StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.hasData) {
    //       if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
    //         final docRef = FirebaseFirestore.instance.collection('adverts').doc();
    //         docRef.set({
    //           'userMail': FirebaseAuth.instance.currentUser!.email.toString(),
    //         }).whenComplete(() {
    //           Navigator.pushAndRemoveUntil(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (BuildContext context) => AddDetailPage(
    //                         docId: docRef.id,
    //                       )),
    //               (route) => false);
    //         });

    //       } else {
    //         Utils.showSnackBar('İlan vermek için mail adresinizi doğrulamalısınız');
    //       }
    //       Utils.showSnackBar('İlan vermek için üye girişi yapmalısınız');
    //     }
    //     if (snapshot.hasError) {
    //       Utils.errorSnackBar('İlan vermek için üye girişi yapmalısınız');
    //     } else {
    //       Utils.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred.tr());
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.userCredential?.user != null) {
          context.read<ProfileBloc>().add(FetchProfileEvent(userId: state.userCredential?.user?.uid));
          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleKeys.mainText_title.tr(),
              ),
              centerTitle: true,
            ),
            drawer: const DrawerPage(),
            body: PersistentTabView(
              context,
              navBarStyle: NavBarStyle.style3,
              controller: _persistentTabController,
              backgroundColor: context.colorScheme.surface,
              screenTransitionAnimation: ScreenTransitionAnimation(curve: Curves.linear),
              screens: _pageList(),
              items: navBarsItem(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.mainText_title.tr()),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.loginPage);
                    },
                    icon: Icon(Icons.login))
              ],
            ),
            drawer: const DrawerPage(),
            body: PersistentTabView(
              context,
              navBarStyle: NavBarStyle.style3,
              controller: _persistentTabController,
              backgroundColor: context.colorScheme.surface,
              screenTransitionAnimation: ScreenTransitionAnimation(
                curve: Curves.linear,
              ),
              screens: _pageListWithoutLogin(),
              items: navBarsItemWithoutLogin(),
            ),
          );
        }
      },
    );
  }
}
