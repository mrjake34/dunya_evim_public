import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/adverts/bloc/advert_bloc.dart';
import 'package:dunya_evim/screens/adverts/model/advert_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/size/radius.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/navigation/navigation_service.dart';

class AdvertSlider extends StatelessWidget {
  const AdvertSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: BlocBuilder<AdvertBloc, AdvertState>(
          buildWhen: (previous, current) => previous.advertList != current.advertList,
          builder: (context, state) {
            if (state.advertList == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.advertList?.length ?? 0,
                itemBuilder: (context, index) {
                  final model = state.advertList?[index];
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.instance.navigateToPage(path: RoutersConstants.showAdvertPage, data: model?.docId);
                        },
                        child: Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AppRadius.cardRadius), topRight: Radius.circular(AppRadius.cardRadius)),
                                child: Image.network(
                                  model?.smallImageUrl ?? '',
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null ? child : const CircularProgressIndicator.adaptive();
                                  },
                                  errorBuilder: (context, exception, stackTrace) {
                                    return Center(
                                      child: Text(
                                        LocaleKeys.errors_imageNotFound.tr(),
                                        style: TextStyle(fontSize: 5),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      model?.title ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                    const Text(''),
                                    Text(
                                      model?.address ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    const Text(''),
                                    Text(
                                      model?.price ?? '',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
