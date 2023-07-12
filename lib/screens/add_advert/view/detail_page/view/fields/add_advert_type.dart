part of '../../detail_page.dart';

class AdvertTypeField extends StatefulWidget {
  AdvertTypeField({
    super.key,
  });

  @override
  State<AdvertTypeField> createState() => _AdvertTypeFieldState();
}

class _AdvertTypeFieldState extends State<AdvertTypeField> {
  late TextEditingController controller;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        if (state.advertTypeEnums != null) {
          controller = TextEditingController(
            text: state.advertTypeEnums!.value.tr(),
          );
        } else {
          controller = TextEditingController();
        }
        return TextFormField(
          readOnly: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            helperText: ' ',
            suffixIcon: Icon(Icons.expand_circle_down_outlined),
            label: RequiredText(text: LocaleKeys.advert_advertType),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(
            context: context,
            widget: AddAdvertType(),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
            ],
          ),
        );
      },
    );
  }
}
