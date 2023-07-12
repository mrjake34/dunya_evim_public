import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/routers/routers.dart';
import '../../core/constants/size/radius.dart';
import '../../core/utils/navigation/navigation_service.dart';
import '../../core/utils/translation/locale_keys.g.dart';
import '../../screens/adverts/model/advert_model.dart';

class AdvertListCard extends StatelessWidget {
  final AdvertModel? model;

  const AdvertListCard({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: GestureDetector(
              onTap: () {
                NavigationService.instance.navigateToPage(path: RoutersConstants.showAdvertPage, data: model?.docId);
              },
              child: Center(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(AppRadius.cardRadius), bottomLeft: Radius.circular(AppRadius.cardRadius)),
                      child: Image.network(
                        model?.smallImageUrl ?? '',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, progress) {
                          return progress == null ? child : const CupertinoActivityIndicator();
                        },
                        errorBuilder: (context, exception, stackTrace) {
                          return Center(
                            child: Text(
                              LocaleKeys.errors_imageNotFound.tr(),
                              style: TextStyle(fontSize: 8),
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        trailing: Text(
                          model?.price ?? '',
                          maxLines: 2,
                          style: TextStyle(fontSize: 12),
                        ),
                        title: Text(
                          model?.title ?? '',
                          maxLines: 2,
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          model?.address ?? '',
                          style: TextStyle(fontSize: 10),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
