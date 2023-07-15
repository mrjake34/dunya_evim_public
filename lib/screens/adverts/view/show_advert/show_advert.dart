import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/constants/path/image_path.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../bloc/advert_bloc.dart';
import 'advert_detail/adverts_detail.dart';
import 'advert_location/show_advert_location.dart';
import 'advert_note/show_advert_note.dart';

part 'show_advert_mixin.dart';

class ShowAdvert extends StatefulWidget {
  final String? docId;
  const ShowAdvert({super.key, required this.docId});

  @override
  State<ShowAdvert> createState() => _ShowAdvertState();
}

class _ShowAdvertState extends State<ShowAdvert> with ShowAdvertMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocBuilder<AdvertBloc, AdvertState>(
        builder: (context, state) {
          if (state.status == Status.success) {
            return PersistentTabView(
              context,
              controller: _controller,
              navBarStyle: NavBarStyle.style3,
              backgroundColor: context.colorScheme.surface,
              screenTransitionAnimation: ScreenTransitionAnimation(curve: Curves.linear),
              screens: _screensList(),
              items: _navBarsItem(),
            );
          } else if (state.status == Status.failed) {
            return Scaffold(
              body: Center(
                child: BodyTitleText(text: LocaleKeys.errors_failedLoadData),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Lottie.asset(ImagePath.loadingAnimation),
              ),
            );
          }
        },
      ),
    );
  }
}
