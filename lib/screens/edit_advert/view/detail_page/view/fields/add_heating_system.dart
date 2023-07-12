part of '../../detail_page.dart';

class AdvertHeatingSystemField extends StatelessWidget {
  const AdvertHeatingSystemField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.heatingSystem == null) {
          return Center(
            child: Container(),
          );
        } else {
          return TextFormField(
            maxLength: 50,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            initialValue: state.heatingSystem ?? state.model?.heatingSystem ?? '',
            onChanged: (value) {
              context.read<EditAdvertBloc>().add(EditAdvertDetailEvent(heatingSystem: value));
            },
            decoration: const InputDecoration(
              filled: true,
              label: RequiredText(text: LocaleKeys.advert_heatingSystem),
              border: AppRadius.textFieldBorder,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
            ]),
          );
        }
      },
    );
  }
}
