part of '../detail_builder.dart';

class AdvertContactField extends StatelessWidget {
  const AdvertContactField({super.key});

  Future<void> whatsApp(String? phone) async {
    try {
      if (!await launchUrl(Uri.parse('whatsapp://send?phone=$phone'))) {
        throw 'WhatsApp açılamadı';
      }
    } catch (e) {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_noWhatsapp.tr());
    }
  }

  Future<void> callPhone(String? phone) async {
    if (await launchUrl(Uri.parse('tel:+$phone'))) {
    } else {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred.tr());
    }
  }

  Future<void> sendMail(String? email) async {
    var mailUrl = 'mailto:$email';
    launchUrl(
      Uri.parse(mailUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertBloc, AdvertState>(
      builder: (context, state) {
        return Column(
          children: [
            AdvertOwnerNameField(
              advertOwnerModel: state.advertOwnerModel,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      if (state.advertOwnerModel?.phone != null) {
                        callPhone(state.advertOwnerModel?.phone);
                      }
                    },
                    icon: const Icon(Icons.call_outlined, color: Colors.teal),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      if (state.advertOwnerModel?.phone != null) {
                        whatsApp(state.advertOwnerModel?.phone);
                      }
                    },
                    icon: const Icon(
                      Icons.video_call_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      if (state.advertOwnerModel?.email != null) {
                        sendMail(state.advertOwnerModel?.email);
                      }
                    },
                    icon: const Icon(
                      Icons.mail_outline,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
