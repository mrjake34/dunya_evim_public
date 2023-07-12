import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/src/dialog/show_dialog.dart';
import 'package:dunya_evim/src/sheets/fixed_size_modal_bottom_sheet.dart';
import 'package:dunya_evim/src/text/body_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../core/constants/enums/bloc_enums.dart';
import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/constants/size/paddings.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../profile/bloc/profile_bloc.dart';
import '../../bloc/add_advert_bloc.dart';
import 'review_detail/review_detail.dart';
import 'review_location/review_location.dart';
import 'package:flutter/material.dart';
import 'review_note/review_note.dart';

part 'add_advert_dialog.dart';

class AddAdvertReviewPage extends StatefulWidget {
  const AddAdvertReviewPage({super.key});

  @override
  State<AddAdvertReviewPage> createState() => _AddAdvertReviewPageState();
}

class _AddAdvertReviewPageState extends State<AddAdvertReviewPage> {
  List<PersistentBottomNavBarItem> _navBarsItem() => [
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.description_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.notes_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.place_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
      ];
  List<Widget> _screensList() => [
        const AddAdvertReviewDetailPage(),
        const AddAdvertReviewNotePage(),
        const AddAdvertReviewLocationPage(),
      ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: PersistentTabView(
        context,
        backgroundColor: context.colorScheme.surface,
        navBarStyle: NavBarStyle.style3,
        items: _navBarsItem(),
        screens: _screensList(),
        floatingActionButton: BlocConsumer<AddAdvertBloc, AddAdvertState>(
          listener: (context, state) {
            if (state.advertDatasUploaded == Status.success) {
              context.read<ProfileBloc>().add(AddAdvertToMyAdvertList(docId: state.docId));
              context.read<AddAdvertBloc>().add(ClearBlocEvent());
              CustomDialog().showCustomDialogError(
                context: context,
                buttonFunction: () => NavigationService.instance.navigateToPageAndRemoveUntil(
                  path: RoutersConstants.home,
                ),
                child: BodyText(
                  text: LocaleKeys.succes_advert_advertAdded,
                ),
              );
            } else if (state.advertDatasUploaded == Status.failed) {
              ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_failedLoadData);
            }
          },
          builder: (context, state) {
            if (state.advertDatasUploaded == Status.loading || state.photoUrlUploaded == Status.loading) {
              return FloatingActionButton.small(
                onPressed: null,
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return FloatingActionButton.small(
                onPressed: () async {
                  await FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddAdvertDialog());
                },
                child: Icon(Icons.send),
              );
            }
          },
        ),
      ),
    );
  }
}
