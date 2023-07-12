part of 'note_page.dart';

class AddNoteField extends StatelessWidget {
  const AddNoteField({
    super.key,
    required this.noteKey,
  });

  final GlobalKey<FormBuilderState> noteKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.note == null) {
          return Center(
            child: Container(),
          );
        } else {
          return FormBuilder(
            key: noteKey,
            child: TextFormField(
              textAlign: TextAlign.center,
              initialValue: state.note ?? state.model?.note ?? '',
              maxLines: 25,
              minLines: 12,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                context.read<EditAdvertBloc>().add(AddAdvertNoteEvent(advertNote: value));
              },
              decoration: const InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: RequiredText(text: LocaleKeys.advert_advertDescription),
                border: AppRadius.textFieldBorder,
              ),
            ),
          );
        }
      },
    );
  }
}
