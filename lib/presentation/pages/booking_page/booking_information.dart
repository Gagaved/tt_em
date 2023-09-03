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
          BookingInformation bookingInformation = BookingInformationMockExtension.createMock();
          bool enabledSkeletonizer = true;
          if(state.isInit==true){
            enabledSkeletonizer= false;
            bookingInformation = state.bookingInformation!;
          }
          return Skeletonizer(
            enabled: enabledSkeletonizer,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title:
                        AppLocalizations.of(context)!.departureBookingInformation,
                    value: bookingInformation.departure),
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title: AppLocalizations.of(context)!
                        .arrivalCountryBookingInformation,
                    value: bookingInformation.arrivalCountry),
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title: AppLocalizations.of(context)!.datesBookingInformation,
                    value:
                        '${bookingInformation.tourDateStart} - ${bookingInformation.tourDateStart}'),
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title: AppLocalizations.of(context)!
                        .numberOfNightsBookingInformation,
                    value:
                        '${bookingInformation.numberOfNights} ${AppLocalizations.of(context)!.nightsTrailingBookingInformation}'),
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title: AppLocalizations.of(context)!.hotelBookingInformation,
                    value: bookingInformation.hotelName),
                const SizedBox(
                  height: 15,
                ),
                _RowInfo(
                    title: AppLocalizations.of(context)!.roomBookingInformation,
                    value: bookingInformation.room),
                const SizedBox(height: 15,),
              ],
            ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
