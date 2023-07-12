part of '../../detail_page.dart';

class AdvertTitleField extends StatelessWidget {
  AdvertTitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          maxLength: 50,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          initialValue: state.title ?? '',
          onChanged: (value) {
            context.read<AddAdvertBloc>().add(AddNewAdvertDetailEvent(title: value));
          },
          decoration: InputDecoration(
            filled: true,
            label: RequiredText(text: LocaleKeys.advert_advertTitle),
            border: AppRadius.textFieldBorder,
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
