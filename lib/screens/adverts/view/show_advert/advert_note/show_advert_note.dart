import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/navigation/navigation_service.dart';
import '../../../../../core/utils/translation/locale_keys.g.dart';
import '../../../bloc/advert_bloc.dart';

class ShowAdvertNote extends StatefulWidget {
  const ShowAdvertNote({super.key});

  @override
  State<ShowAdvertNote> createState() => _ShowAdvertNoteState();
}

class _ShowAdvertNoteState extends State<ShowAdvertNote> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.advert_advertDescription.tr(),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: () => NavigationService.instance.navigateToBack(), icon: Icon(Icons.chevron_left_outlined)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<AdvertBloc, AdvertState>(
            builder: (context, state) {
              return SizedBox(
                width: context.pageSize.width,
                height: context.pageSize.height,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.pagePadding),
                  child: Text(state.advertDetailModel?.note ?? ''),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
