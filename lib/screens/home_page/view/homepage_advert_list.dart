import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/size/paddings.dart';
import '../../../src/cards/advert_list_card.dart';
import '../../adverts/bloc/advert_bloc.dart';
import '../../adverts/model/advert_model.dart';


class HomePageAdvertList extends StatefulWidget {
  const HomePageAdvertList({super.key});

  @override
  State<HomePageAdvertList> createState() => _HomePageAdvertListState();
}

class _HomePageAdvertListState extends State<HomePageAdvertList> {
  @override
  Widget build(BuildContext context) {
    context.read<AdvertBloc>().add(FetchAdvertsEvent());
    return SizedBox(
      height: context.pageSize.height / 4,
      child: BlocBuilder<AdvertBloc, AdvertState>(
        buildWhen: (previous, current) => previous.advertList != current.advertList,
        builder: (context, state) {
          if (state.advertList != null) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
              itemCount: (state.advertList?.length ?? 0) <= 5 ? state.advertList?.length : 5,
              itemBuilder: (context, index) {
                final advertModel = state.advertList?[index];
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
