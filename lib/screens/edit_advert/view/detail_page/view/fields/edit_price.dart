part of '../../detail_page.dart';

class AdvertPriceField extends StatelessWidget {
  const AdvertPriceField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.price == null) {
          return Center(
            child: Container(),
          );
        } else {
          return TextFormField(
            autofocus: true,
            maxLength: 18,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              state.currencyTextInputFormatter ?? CurrenyConstants.tl,
            ],
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            initialValue: state.price ?? state.model?.price ?? '',
            onChanged: (value) {
              context.read<EditAdvertBloc>().add(
                    EditAdvertDetailEvent(
                      price: value,
                    ),
                  );
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: ChangeCurrency()),
                    icon: state.currencyIcon ?? Icon(Icons.currency_exchange)),
                filled: true,
                border: AppRadius.textFieldBorder,
                label: RequiredText(text: LocaleKeys.advert_advertPrice)),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
            ]),
          );
        }
      },
    );
  }
}
