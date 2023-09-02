part of 'booking_page.dart';

class _BookingInformation extends StatelessWidget {
  const _BookingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      roundedBottomBorder: true,
      roundedTopBorder: true,
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _RowInfo(
                  title:
                      AppLocalizations.of(context)!.departureBookingInformation,
                  value: state.bookingInformation!.departure),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RowInfo extends StatelessWidget {
  const _RowInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.textGrayColor),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium!),
        ),
      ],
    );
  }
}
