part of 'booking_page.dart';

class _BuyButton extends StatelessWidget {
  const _BuyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.isInit == false) return const SizedBox.shrink();
        return AppContentCard(
          roundedBottomBorder: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 20),
            child: ElevatedButton(
                onPressed: () {
                  context.read<BookingBloc>().add(BookingBuyButtonPressEvent());
                  if (state.allFieldsSetAndValid) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const PaymentPage();
                    }));
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                        child: Text(
                      '${AppLocalizations.of(context)!.payButton} ${priceNumberFormat(state.totalPrice!)} ₽',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    )))),
          ),
        );
      },
    );
  }
}
