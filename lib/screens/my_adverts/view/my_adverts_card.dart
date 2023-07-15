import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/constants/color/colors.dart';
import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:dunya_evim/core/utils/navigation/navigation_service.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/adverts/model/advert_model.dart';
import 'package:dunya_evim/screens/my_adverts/bloc/my_adverts_bloc.dart';
import 'package:dunya_evim/src/sheets/fixed_size_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/size/radius.dart';
import '../../edit_advert/bloc/edit_advert_bloc.dart';
import '../../profile/bloc/profile_bloc.dart';
part 'action_button_bottom_sheet.dart';
part 'action_button_bottom_sheet_mixin.dart';

class MyAdvertCard extends StatelessWidget {
  final AdvertModel? _advert;

  const MyAdvertCard(this._advert, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          NavigationService.instance.navigateToPage(path: RoutersConstants.showAdvertPage, data: _advert?.docId);
        },
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.cardRadius),
                  ),
                  child: Image.network(
                    "${_advert?.smallImageUrl}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null ? child : const CupertinoActivityIndicator();
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
                Flexible(
                  child: Column(
                    children: [
                      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                        if (_advert?.approved == false) {
                          if (_advert?.hasMessage == true) {
                            return Center(
                              child: Text(
                                'İlan Red Edildi: ${_advert?.adminMessage}',
                                style: const TextStyle(fontSize: 12, color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                'İlan inceleme aşamasında',
                                style: TextStyle(fontSize: 12, color: Colors.red),
                              ),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text(
                              'İlan yayında',
                              style: TextStyle(fontSize: 12, color: Colors.green),
                            ),
                          );
                        }
                      }),
                      ListTile(
                        title: Text(
                          "${_advert?.title}",
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "${_advert?.price}",
                          maxLines: 1,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${_advert?.address}",
                          maxLines: 2,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: context.pageSize.width,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppRadius.cardRadius),
                      bottomRight: Radius.circular(
                        AppRadius.cardRadius,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_advert != null) {
                    FixedSizeModalBottomSheet().openCustomModalSheet(
                      context: context,
                      widget: _ActionButtonBottomSheet(
                        model: _advert!,
                      ),
                    );
                  }
                },
                child: Text(LocaleKeys.mainText_actions.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> deleteAdvert(BuildContext context) async {
  //   if (_advert?.userMail == FirebaseAuth.instance.currentUser?.email) {
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('İlanı Sil'),
  //             content: SizedBox(
  //               height: 100,
  //               child: Column(
  //                 children: const [
  //                   Text(
  //                     'İlanınızın kalıcı olarak silinmesini kabul ediyor musunuz?',
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   SizedBox(
  //                     height: 3,
  //                   ),
  //                   Text(
  //                     'Bu işlemi geri alamazsınız',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(color: Colors.red),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             actions: [
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: const Text('Vazgeç')),
  //                   ),
  //                   Expanded(
  //                     child: TextButton(
  //                         onPressed: () async {
  //                           try {
  //                             FirebaseFirestore.instance
  //                                 .collection('adverts')
  //                                 .doc(_advert?.docId)
  //                                 .collection('datas')
  //                                 .doc('data')
  //                                 .delete();
  //                             FirebaseFirestore.instance
  //                                 .collection('adverts')
  //                                 .doc(_advert?.docId)
  //                                 .collection('datas')
  //                                 .doc('imageList')
  //                                 .delete();
  //                             FirebaseFirestore.instance
  //                                 .collection('adverts')
  //                                 .doc(_advert?.docId)
  //                                 .delete();
  //                             final delRef = FirebaseStorage.instance.ref().child(
  //                                 "${FirebaseAuth.instance.currentUser!.email.toString()}/adverts/${_advert?.docId}");
  //                             final images = await delRef.listAll();
  //                             if (images.items.isNotEmpty == true) {
  //                               for (var item in images.items) {
  //                                 item.delete();
  //                               }
  //                             }
  //                           } finally {
  //                             Utils.showSnackBar('İlan Silindi');
  //                             Navigator.of(context).pop();
  //                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const HomePage()), (route) => false);
  //                           }
  //                         },
  //                         child: const Text('Evet')),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           );
  //         });
  //   }
  // }
}
