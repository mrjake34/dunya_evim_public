import 'dart:io';
import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:dunya_evim/screens/edit_advert/view/close_edit_advert_button.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/sheets/fixed_size_modal_bottom_sheet.dart';
import '../../../../../src/text/button_text.dart';

part 'bottom_button.dart';
part 'floating_bottom.dart';
part 'image_picker_bottom_sheet.dart';
part 'add_photo_field.dart';

class EditAdvertEditPhotoPage extends StatefulWidget {
  const EditAdvertEditPhotoPage({super.key});

  @override
  State<EditAdvertEditPhotoPage> createState() => _EditAdvertEditPhotoPageState();
}

class _EditAdvertEditPhotoPageState extends State<EditAdvertEditPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.advert_addAdvertPhoto.tr()),
          centerTitle: true,
          actions: [
            BlocBuilder<EditAdvertBloc, EditAdvertState>(
              buildWhen: (previous, current) => previous.advertDatasUploaded != current.advertDatasUploaded,
              builder: (context, state) {
                if (state.advertDatasUploaded == Status.loading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  return CloseEditAdvertButton();
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BodyTitleText(text: LocaleKeys.alerts_max5Photo),
                _AddPhotoField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavBar());
  }
}
