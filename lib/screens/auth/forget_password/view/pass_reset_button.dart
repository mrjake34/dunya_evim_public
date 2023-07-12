part of '../pass_reset.dart';

class PassResetButton extends StatelessWidget {
  PassResetButton({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassResetBloc, PassResetState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ShowSnackbar.instance.showSnackBar('Sıfırlama Maili Gönderildi');
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return LoadingButton();
        } else {
          return MainElevatedButton(
            onPressed: formKey.currentState?.validate() == false
                ? null
                : () {
                    context.read<PassResetBloc>().add(PassResetEmailSender(email: emailController.text.trim()));
                  },
            text: LocaleKeys.mainText_sendEmail.tr(),
          );
        }
      },
    );
  }
}
