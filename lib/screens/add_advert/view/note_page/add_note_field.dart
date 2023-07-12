part of 'note_page.dart';

class AddNoteField extends StatelessWidget {
  const AddNoteField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return TextFormField(
          textAlign: TextAlign.center,
          initialValue: state.note,
          maxLines: 25,
          minLines: 12,
          maxLength: 1000,
          onChanged: (value) {
            context.read<AddAdvertBloc>().add(AddAdvertNoteEvent(advertNote: value));
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RequiredText(text: LocaleKeys.advert_advertDescription),
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
