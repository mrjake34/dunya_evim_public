import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/constants/path/image_path.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/advert_list_countries/bloc/advert_list_countries_bloc.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/enums/advert_list_enums.dart';
import '../../../src/cards/advert_list_card.dart';

class AdvertCountriesPage extends StatefulWidget {
  final AdvertListCountriesEnums advertListCountries;
  const AdvertCountriesPage({super.key, required this.advertListCountries});

  @override
  State<AdvertCountriesPage> createState() => _AbdListPageState();
}

class _AbdListPageState extends State<AdvertCountriesPage> {
  @override
  void initState() {
    context.read<AdvertListCountriesBloc>().add(FetchAdvertListCountriesEvent(widget.advertListCountries.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.advertListCountries.localeKeys.tr()),
      ),
      body: BlocBuilder<AdvertListCountriesBloc, AdvertListCountriesState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Center(
              child: LottieBuilder.asset(ImagePath.loadingAnimation),
            );
          } else if (state.status == Status.success) {
            if (state.advertList != null) {
              return ListView.builder(
                itemCount: state.advertList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return AdvertListCard(model: state.advertList?[index]);
                },
              );
            } else {
              return Center(
                child: BodyTitleText(text: LocaleKeys.errors_failedLoadData),
              );
            }
          } else {
            return Center(
              child: BodyTitleText(text: LocaleKeys.errors_anErrorHasOccurred),
            );
          }
        },
      ),
    );
  }
}
