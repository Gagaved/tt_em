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
          if (state.isInit == false) return const SizedBox.shrink();
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title:
                      AppLocalizations.of(context)!.departureBookingInformation,
                  value: state.bookingInformation!.departure),
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title: AppLocalizations.of(context)!
                      .arrivalCountryBookingInformation,
                  value: state.bookingInformation!.arrivalCountry),
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title: AppLocalizations.of(context)!.datesBookingInformation,
                  value:
                      '${state.bookingInformation!.tourDateStart} - ${state.bookingInformation!.tourDateStart}'),
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title: AppLocalizations.of(context)!
                      .numberOfNightsBookingInformation,
                  value:
                      '${state.bookingInformation!.numberOfNights} ${AppLocalizations.of(context)!.nightsTrailingBookingInformation}'),
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title: AppLocalizations.of(context)!.hotelBookingInformation,
                  value: state.bookingInformation!.hotelName),
              const SizedBox(
                height: 15,
              ),
              _RowInfo(
                  title: AppLocalizations.of(context)!.roomBookingInformation,
                  value: state.bookingInformation!.room),
              SizedBox(height: 15,),
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
          flex: 4,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.textGrayColor),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium!),
        ),
      ],
    );
  }
}
