import 'dart:io';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../../../src/sheets/fixed_size_modal_bottom_sheet.dart';
import '../../../../../src/text/button_text.dart';
import '../../bloc/add_advert_bloc.dart';

part 'bottom_nav_bar.dart';
part 'floating_bottom.dart';
part 'image_picker_bottom_sheet.dart';
part 'add_photo_field.dart';

class AddAdvertAddPhotoPage extends StatefulWidget {
  const AddAdvertAddPhotoPage({super.key});

  @override
  State<AddAdvertAddPhotoPage> createState() => _AddAdvertAddPhotoPageState();
}

class _AddAdvertAddPhotoPageState extends State<AddAdvertAddPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.advert_addAdvertPhoto.tr()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BodyTitleText(text: LocaleKeys.alerts_max5Photo),
                AddPhotoField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavBar());
  }
}
