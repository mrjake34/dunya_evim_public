import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/size/paddings.dart';
import '../../../core/utils/translation/locale_keys.g.dart';
import 'advert_slider.dart';
import 'blog_widget.dart';
import 'homepage_advert_list.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
              height: 50,
              child: Text(
                LocaleKeys.advert_featuredAdverts.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const AdvertSlider(),
          Divider(
            thickness: 2,
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
              height: 50,
              child: Text(
                LocaleKeys.advert_lastAdverts.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const HomePageAdvertList(),
          Divider(
            thickness: 2,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
              height: 20,
              child: Text(
                LocaleKeys.advert_blogPosts.tr(),
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          const BlogWidget(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
