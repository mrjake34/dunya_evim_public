// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../detail_page.dart';

class AdvertPriceField extends StatelessWidget {
  AdvertPriceField({
    Key? key,
  });
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        if (controller.text.isEmpty) {
          if (state.price != null) {
            controller.text = state.price!;
          }
        }
        return TextFormField(
          autofocus: true,
          maxLength: 18,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [state.currencyTextInputFormatter ?? CurrenyConstants.tl],
          controller: controller,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<AddAdvertBloc>().add(AddNewAdvertDetailEvent(price: value));
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () => FixedSizeModalBottomSheet().openCustomModalSheet(
                      context: context,
                      widget: ChangeCurrency(
                        controller: controller,
                      )),
                  icon: state.currencyIcon ?? Icon(Icons.currency_exchange)),
              filled: true,
              border: AppRadius.textFieldBorder,
              label: RequiredText(text: LocaleKeys.advert_advertPrice)),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
