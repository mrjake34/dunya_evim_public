part of '../detail_page.dart';

class ChangeCurrency extends StatelessWidget {
  const ChangeCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        return SizedBox(
          width: context.pageSize.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.read<EditAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.euSymbol,
                            currencyTextInputFormatter: CurrenyConstants.eu,
                            price: state.price,
                          ),
                        );
                  },
                  label: Text(
                    LocaleKeys.mainText_euro.tr(),
                  ),
                  icon: const Icon(Icons.euro),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<EditAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.usdSymbol,
                            currencyTextInputFormatter: CurrenyConstants.usd,
                            price: state.price,
                          ),
                        );
                  },
                  label: Text(
                    LocaleKeys.mainText_usDollar.tr(),
                  ),
                  icon: const Icon(Icons.attach_money),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<EditAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.tlSymbol,
                            currencyTextInputFormatter: CurrenyConstants.tl,
                            price: state.price,
                          ),
                        );
                  },
                  label: Text(
                    LocaleKeys.mainText_turkishLira.tr(),
                  ),
                  icon: const Icon(Icons.currency_lira),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<EditAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.poundSymbol,
                            currencyTextInputFormatter: CurrenyConstants.pound,
                            price: state.price,
                          ),
                        );
                  },
                  label: Text(
                    LocaleKeys.mainText_gbpPound.tr(),
                  ),
                  icon: const Icon(Icons.currency_pound),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
