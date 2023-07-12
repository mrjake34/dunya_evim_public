import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/size/paddings.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../src/cards/advert_list_card.dart';
import '../../bloc/advert_bloc.dart';
import '../../model/advert_model.dart';

class AdvertsList extends StatefulWidget {
  const AdvertsList({Key? key}) : super(key: key);

  @override
  State<AdvertsList> createState() => _AdvertsListState();
}

class _AdvertsListState extends State<AdvertsList> {
  @override
  Widget build(BuildContext context) {
    context.read<AdvertBloc>().add(FetchAdvertsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.advert_allAdvert.tr()),
        centerTitle: true,
      ),
      body: BlocBuilder<AdvertBloc, AdvertState>(
        buildWhen: (previous, current) => previous.advertList != current.advertList,
        builder: (context, state) {
          if (state.advertList != null) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
              itemCount: state.advertList?.length ?? 0,
              itemBuilder: (context, index) {
                AdvertModel? advertModel = state.advertList?[index].data();
                return AdvertListCard(
                  model: advertModel,
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
