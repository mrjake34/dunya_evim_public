part of '../detail_page.dart';

class ChangeCurrency extends StatelessWidget {
  const ChangeCurrency({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return SizedBox(
          width: context.pageSize.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.read<AddAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.euSymbol,
                            currencyTextInputFormatter: CurrenyConstants.eu,
                          ),
                        );
                    controller.clear();
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
                    context.read<AddAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.usdSymbol,
                            currencyTextInputFormatter: CurrenyConstants.usd,
                          ),
                        );
                    controller.clear();
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
                    context.read<AddAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.tlSymbol,
                            currencyTextInputFormatter: CurrenyConstants.tl,
                          ),
                        );
                    controller.clear();
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
                    context.read<AddAdvertBloc>().add(
                          ChangeCurrencyEvent(
                            currencyIcon: IconConstants.poundSymbol,
                            currencyTextInputFormatter: CurrenyConstants.pound,
                          ),
                        );
                    controller.clear();
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
