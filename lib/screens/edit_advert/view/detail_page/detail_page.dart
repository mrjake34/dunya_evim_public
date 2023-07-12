import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/constants/currency/curreny_constants.dart';
import 'package:dunya_evim/core/constants/icon/icon_constants.dart';
import 'package:dunya_evim/core/constants/lists/advert_list.dart';
import 'package:dunya_evim/core/constants/size/radius.dart';
import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:dunya_evim/src/text/required_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../../src/nav_bars/add_advert_bottom_nav_bar.dart';
import '../../../../../src/sheets/fixed_size_modal_bottom_sheet.dart';
import '../close_edit_advert_button.dart';

part 'view/change_currency_alert_dialog.dart';
part 'detail_page_mixin.dart';
part 'view/bottom_buttom.dart';
part 'view/fields/bottomsheets/add_advert_type.dart';
part 'view/fields/bottomsheets/add_number_of_rooms.dart';
part 'view/fields/bottomsheets/add_has_garage.dart';
part 'view/fields/bottomsheets/add_furniture.dart';
part 'view/fields/bottomsheets/add_in_site.dart';
part 'view/fields/bottomsheets/add_can_video_call.dart';
part 'view/fields/bottomsheets/add_citizenship_rights.dart';
part 'view/fields/edit_price.dart';
part 'view/fields/edit_title.dart';
part 'view/fields/edit_advert_type.dart';
part 'view/fields/add_in_site.dart';
part 'view/fields/add_has_garage.dart';
part 'view/fields/edit_number_of_rooms.dart';
part 'view/fields/add_heating_system.dart';
part 'view/fields/add_furniture_status.dart';
part 'view/fields/edit_living_area.dart';
part 'view/fields/add_age_of_contruction.dart';
part 'view/fields/add_can_video_call.dart';
part 'view/fields/add_citizenship_rights.dart';
part 'view/fields/add_floor_in_contruction.dart';

class EditAdvertEditDetailPage extends StatefulWidget {
  const EditAdvertEditDetailPage({super.key});

  @override
  State<EditAdvertEditDetailPage> createState() => _EditAdvertEditDetailPageState();
}

class _EditAdvertEditDetailPageState extends State<EditAdvertEditDetailPage> with DetailPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.advert_addAdvertDetail.tr(),
        ),
        actions: [
          CloseEditAdvertButton(),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.pagePadding),
        child: Center(
          child: FormBuilder(
            key: formKey,
            autoFocusOnValidationFailure: true,
            child: Wrap(
              runSpacing: AppPadding.pagePadding,
              children: [
                AdvertTitleField(),
                AdvertPriceField(),
                AdvertTypeField(),
                AdvertLivingAreaField(),
                AdvertNumberOfRoomsField(),
                AdvertAgeOfConstructionField(),
                AdvertFloorInConstructionField(),
                AdvertHeatingSystemField(),
                AdvertHasGarageField(),
                AdvertFurnitureStatusField(),
                AdvertInSiteField(),
                AdvertCanVideoCallField(),
                AdvertCitizienshipRightsField(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        formKey: formKey,
      ),
    );
  }
}
