import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/size/paddings.dart';
import '../../../../../../core/utils/translation/locale_keys.g.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../bloc/add_advert_bloc.dart';
import '../../close_add_advert_button.dart';

class AddAdvertReviewNotePage extends StatefulWidget {
  const AddAdvertReviewNotePage({Key? key}) : super(key: key);

  @override
  State<AddAdvertReviewNotePage> createState() => _AddAdvertReviewNotePageState();
}

class _AddAdvertReviewNotePageState extends State<AddAdvertReviewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.advert_advertDetail.tr(),
        ),
        leading: IconButton(
          onPressed: () => NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertPhotoPage),
          icon: Icon(Icons.chevron_left),
        ),
        actions: [
          CloseAddAdvertButton(),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.pagePadding),
        child: Center(
          child: BlocBuilder<AddAdvertBloc, AddAdvertState>(
            builder: (context, state) {
              return TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  filled: true,
                ),
                initialValue: state.note,
                minLines: 12,
                maxLines: 25,
              );
            },
          ),
        ),
      ),
    );
  }
}
