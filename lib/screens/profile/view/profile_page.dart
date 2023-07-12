import 'package:country_code_picker/country_code_picker.dart';
import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/constants/color/colors.dart';
import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/constants/path/image_path.dart';
import 'package:dunya_evim/core/utils/navigation/navigation_service.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:dunya_evim/src/sheets/fixed_size_modal_bottom_sheet.dart';
import 'package:dunya_evim/src/sheets/full_screen_modal_bottom_sheet.dart';
import 'package:dunya_evim/src/text/body_text.dart';
import 'package:dunya_evim/src/text/button_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/routers/routers.dart';
import '../../../core/constants/size/paddings.dart';
import '../../../core/utils/translation/locale_keys.g.dart';
import '../../../src/buttons/main_elevated_button.dart';
import '../../../src/dialog/show_dialog.dart';
import '../../../src/text/body_title.dart';
import '../../auth/login/bloc/login_bloc.dart';

part 'profile_photo.dart';
part 'choose_photo_bottom_sheet.dart';
part 'profile_page_mixin.dart';
part 'edit_phone_number.dart';
part 'edit_location.dart';
part 'phone_field.dart';
part 'edit_biography.dart';
part 'biography_field.dart';
part 'email_field.dart';
part 'country_field.dart';
part 'name_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfilePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          children: [
            ProfilePhoto(),
            const SizedBox(height: 20),
            NameField(),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.primary,
                ),
              ),
              child: Column(
                children: [
                  CountryField(),
                  EmailField(),
                  PhoneField(),
                  BiographyField(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
