import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dunya_evim/core/constants/enums/user_enums.dart';
import 'package:dunya_evim/core/constants/path/image_path.dart';
import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/profile/model/user_model.dart';
import 'package:dunya_evim/src/text/body_text.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class OwnerProfilePage extends StatelessWidget {
  final UserModel? advertOwnerModel;
  OwnerProfilePage({required this.advertOwnerModel, super.key});

  final storageRef = FirebaseStorage.instance.ref();

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.profile_profileTitle.tr(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
            ),
            Stack(
              children: <Widget>[
                ClipOval(
                  child: Image.network('${advertOwnerModel?.ppUrl}${UserEnums.userPP.value}', width: 175.0, height: 175.0, fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                    return progress == null ? child : const LinearProgressIndicator();
                  }, errorBuilder: (context, exception, StackTrace? stackTrace) {
                    return ClipOval(
                      child: Image.asset(
                        ImagePath.dunyaEvimLogoPath,
                        width: 175.0,
                        height: 175.0,
                        fit: BoxFit.contain,
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(advertOwnerModel?.fullName ?? '',
                    style: const TextStyle(
                      fontSize: 25,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const BodyText(text: LocaleKeys.profile_livingArena),
                      subtitle: Text(advertOwnerModel?.country ?? ''),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(color: Colors.lightGreen, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.location_city,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const BodyText(
                        text: LocaleKeys.profile_emailAddress,
                      ),
                      subtitle: Text(advertOwnerModel?.email ?? ''),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                        child: const Icon(
                          Icons.mail,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const BodyText(text: LocaleKeys.profile_phoneNumber),
                      subtitle: Text('${advertOwnerModel?.phone ?? LocaleKeys.mainText_noPhoneNumer.tr()}'),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                        padding: const EdgeInsets.only(top: 3.0, left: 15, right: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const BodyTitleText(text: LocaleKeys.profile_biography),
                            BodyText(text: advertOwnerModel?.userBio ?? ''),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
