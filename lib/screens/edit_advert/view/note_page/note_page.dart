import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:dunya_evim/screens/edit_advert/view/close_edit_advert_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/constants/size/radius.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../../../src/text/required_text.dart';

part 'bottom_button.dart';
part 'add_note_field.dart';

class EditAdvertEditNotePage extends StatefulWidget {
  const EditAdvertEditNotePage({super.key});

  @override
  State<EditAdvertEditNotePage> createState() => _EditAdvertEditNotePageState();
}

class _EditAdvertEditNotePageState extends State<EditAdvertEditNotePage> {
  final GlobalKey<FormBuilderState> noteKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.advert_editAdvertNote.tr()),
          actions: [
            CloseEditAdvertButton(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.pagePadding),
          child: Column(
            children: [
              AddNoteField(noteKey: noteKey),
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(noteKey: noteKey,),
      ),
    );
  }
}
