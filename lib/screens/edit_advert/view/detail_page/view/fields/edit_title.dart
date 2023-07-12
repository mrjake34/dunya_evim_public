part of '../../detail_page.dart';

class AdvertTitleField extends StatelessWidget {
  const AdvertTitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.title == null) {
          return Center(
            child: Container(),
          );
        } else {
          return TextFormField(
            autofocus: true,
            maxLength: 50,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            initialValue: state.title ?? state.model?.title ?? '',
            onChanged: (value) {
              context.read<EditAdvertBloc>().add(EditAdvertDetailEvent(title: value));
            },
            decoration: InputDecoration(
              filled: true,
              label: RequiredText(text: LocaleKeys.advert_advertTitle),
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
