part of 'register_page.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: [
        AutofillHints.name,
      ],
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          size: 20,
        ),
        label: RequiredText(
          text: LocaleKeys.profile_fullName.tr(),
        ),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
          ),
        ],
      ),
    );
  }
}
