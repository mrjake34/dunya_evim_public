import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/sheets/full_screen_modal_bottom_sheet.dart';
import '../../../../profile/bloc/profile_bloc.dart';
import 'detail_builder.dart';
import 'detail_slider_field/adverts_slider.dart';

part 'advert_detail_mixin.dart';

class AdvertDetailPage extends StatefulWidget {
  final String? docId;

  const AdvertDetailPage({super.key, required this.docId});

  @override
  State<AdvertDetailPage> createState() => _AdvertDetailPageState();
}

class _AdvertDetailPageState extends State<AdvertDetailPage> with AdvertDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.advert_advertDetail.tr()),
        centerTitle: true,
        leading: IconButton(onPressed: () => NavigationService.instance.navigateToBack(), icon: Icon(Icons.chevron_left_outlined)),
      ),
      body: PageBuilder(widget: widget),
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
    required this.widget,
  });

  final AdvertDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                  onTap: () async {
                    FullScreenModalBottomSheet().openCustomModalSheet(context: context, widget: FullScreenBottomSheet());
                  },
                  child: ShowSliderWidget(docId: widget.docId)),
              Positioned(
                top: 10.0,
                left: 30.0,
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profstate) {
                    return IconButton(
                      onPressed: () async {
                        if (profstate.userModel != null) {
                          if ((profstate.userModel?.myFavoriteList?.contains(widget.docId) ?? false) == true) {
                          } else {
                            // await FirebaseFirestore.instance.collection(FireStoreEnums.users.value).doc(userMail).update({
                            //   FireStoreEnums.favoriteList.value: FieldValue.arrayRemove([widget.docId]),
                            // }).whenComplete(() {
                            //   setState(() {
                            //     inMyList = false;
                            //   });

                            //   Utils.showSnackBar(LocaleKeys.succes_removedFromFavoriteList.tr());
                            // });
                          }
                        } else {
                          NavigationService.instance.navigateToPage(path: RoutersConstants.loginPage);
                        }
                      },
                      icon: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black87, offset: Offset(-0.5, 1.5), spreadRadius: 0.3, blurRadius: 2.5)]),
                          child: LayoutBuilder(builder: (context, constraints) {
                            if ((profstate.userModel?.myFavoriteList?.contains(widget.docId) ?? false) == true) {
                              return Icon(
                                Icons.favorite,
                                color: (Theme.of(context).brightness == Brightness.dark ? Colors.red : Colors.red),
                                size: 20,
                              );
                            }
                            return const Icon(
                              Icons.favorite_border,
                              fill: 0.1,
                              color: Colors.red,
                              size: 20,
                            );
                          })),
                    );
                  },
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          AdvertContactField(),
          Divider(
            thickness: 2,
            height: 2,
          ),
          DetailBuilder(
            docId: widget.docId ?? '',
          ),
        ],
      ),
    );
  }
}
