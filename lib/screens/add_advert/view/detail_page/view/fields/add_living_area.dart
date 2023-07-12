part of '../../detail_page.dart';

class AdvertLivingAreaField extends StatelessWidget {
  AdvertLivingAreaField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return TextFormField(
          maxLength: 5,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          initialValue: state.livingArea ?? '',
          onChanged: (value) {
            context.read<AddAdvertBloc>().add(AddNewAdvertDetailEvent(livingArea: value));
          },
          decoration: const InputDecoration(
            filled: true,
            label: RequiredText(text: LocaleKeys.advert_livingArea),
            border: AppRadius.textFieldBorder,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
