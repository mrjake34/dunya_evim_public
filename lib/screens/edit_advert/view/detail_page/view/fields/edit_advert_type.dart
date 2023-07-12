part of '../../detail_page.dart';

class AdvertTypeField extends StatefulWidget {
  const AdvertTypeField({
    super.key,
  });

  @override
  State<AdvertTypeField> createState() => _AdvertTypeFieldState();
}

class _AdvertTypeFieldState extends State<AdvertTypeField> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.advertType == null) {
          return Center(
            child: Container(),
          );
        } else {
          if (state.model?.advertType != null) {
            _controller = TextEditingController(
              text: state.advertTypeEnums?.value.tr() ?? state.model?.advertType?.tr(),
            );
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
              label: RequiredText(text: LocaleKeys.advert_advertType),
              border: AppRadius.textFieldBorder,
            ),
            onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddAdvertType()),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
            ]),
          );
        }
      },
    );
  }
}
