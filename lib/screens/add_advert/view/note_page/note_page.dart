import 'package:dunya_evim/screens/add_advert/view/close_add_advert_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/constants/size/radius.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../../../src/text/required_text.dart';
import '../../bloc/add_advert_bloc.dart';

part 'bottom_button.dart';
part 'add_note_field.dart';

class AddAdvertAddNotePage extends StatelessWidget {
  AddAdvertAddNotePage({super.key});
  final GlobalKey<FormBuilderState> noteKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.advert_addAdvertNote.tr()),
          actions: [
            CloseAddAdvertButton(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: Column(
            children: [
              FormBuilder(key: noteKey, child: AddNoteField()),
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(
          noteKey: noteKey,
        ),
      ),
    );
  }
}
