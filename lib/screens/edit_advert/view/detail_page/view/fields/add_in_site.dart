part of '../../detail_page.dart';

class AdvertInSiteField extends StatefulWidget {
  const AdvertInSiteField({
    super.key,
  });

  @override
  State<AdvertInSiteField> createState() => _AdvertInSiteFieldState();
}

class _AdvertInSiteFieldState extends State<AdvertInSiteField> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.inSite != null) {
          _controller = TextEditingController(text: state.inSiteEnums?.value.tr() ?? state.model?.inSite?.tr() ?? '');
        } else {
          _controller = TextEditingController();
        }
        return TextFormField(
          readOnly: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            helperText: ' ',
            suffixIcon: Icon(Icons.expand_circle_down_outlined),
            label: RequiredText(text: LocaleKeys.advert_inSite),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddInSite()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
