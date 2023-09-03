part of 'booking_page.dart';

class _PricesInformation extends StatelessWidget {
  const _PricesInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        BookingInformation bookingInformation = BookingInformationMockExtension.createMock();
        bool enabledSkeletonizer = true;
        if(state.isInit==true){
          enabledSkeletonizer= false;
          bookingInformation = state.bookingInformation!;
        }
        var tourPrice = bookingInformation.tourPrice;
        var fuelCharge = bookingInformation.fuelCharge;
        var serviceCharge = bookingInformation.serviceCharge;
        var totalPrice = state.totalPrice??100000;///100000 - для скелетона
        return Skeletonizer(
          enabled: enabledSkeletonizer,
          child: AppContentCard(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                _RowPriceWidget(
                  title: AppLocalizations.of(context)!.tourPrice,
                  value: '${priceNumberFormat(tourPrice)} ₽',
                ),
                const SizedBox(
                  height: 15,
                ),
                _RowPriceWidget(
                  title: AppLocalizations.of(context)!.fuelCharge,
                  value: "${priceNumberFormat(fuelCharge)} ₽",
                ),
                const SizedBox(
                  height: 15,
                ),
                _RowPriceWidget(
                  title: AppLocalizations.of(context)!.serviceCharge,
                  value: "${priceNumberFormat(serviceCharge)} ₽",
                ),
                const SizedBox(
                  height: 15,
                ),
                _RowPriceWidget(
                  title: AppLocalizations.of(context)!.totalPrice,
                  value: "${priceNumberFormat(totalPrice)} ₽",
                  isTotalPrice: true,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RowPriceWidget extends StatelessWidget {
  const _RowPriceWidget(
      {super.key,
      required this.title,
      required this.value,
      this.isTotalPrice = false});

  final String title;
  final String value;
  final bool isTotalPrice;

  @override
  Widget build(BuildContext context) {
    var valueStyle = Theme.of(context).textTheme.bodyMedium!;
    if (isTotalPrice) {
      valueStyle = valueStyle.copyWith(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.textGrayColor),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            value,
            style: valueStyle,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
