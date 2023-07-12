import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/constants/routers/routers.dart';
import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:dunya_evim/core/utils/navigation/navigation_service.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/auth/login/bloc/login_bloc.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:dunya_evim/src/buttons/loading_button.dart';
import 'package:dunya_evim/src/dialog/show_dialog.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile_verify.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          children: [
            Text(
              LocaleKeys.mainText_verifyMailPageContextText.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: context.colorScheme.secondary,
              ),
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              listenWhen: (previous, current) => previous.verifyEmailResender != current.verifyEmailResender,
              listener: (context, state) async {
                if (state.verifyEmailResender == Status.success) {
                  await FirebaseService.instance.firebaseAuth.signOut();
                  context.read<ProfileBloc>().clear();
                  context.read<LoginBloc>().clear();
                  CustomDialog().showCustomDialogError(
                    context: context,
                    child: BodyTitleText(
                      text: LocaleKeys.alerts_resendEmailSignOutAlert,
                    ),
                    buttonFunction: () {
                      NavigationService.instance.navigateToPageAndRemoveUntil(
                        path: RoutersConstants.home,
                      );
                    },
                  );
                }
              },
              buildWhen: (previous, current) => previous.verifyEmailResender != current.verifyEmailResender,
              builder: (context, state) {
                if (state.verifyEmailResender == Status.loading) {
                  return LoadingButton();
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(ResendVerifyEmailEvent());
                    },
                    child: Text(LocaleKeys.mainText_reSendVerifyEmail.tr()),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
