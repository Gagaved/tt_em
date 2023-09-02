part of 'booking_page.dart';


class _HotelInformation extends StatelessWidget {
  const _HotelInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContentCard(
      roundedTopBorder: true,
      roundedBottomBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          _Rating(),
          SizedBox(height: 10),
          _HotelName(),
          SizedBox(height: 10),
          _HotelAddress(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.isInit == false) return const SizedBox.shrink(); //todo replace to skeleton
        int rating = state.bookingInformation!.rating;
        RatingColor ratingColor = getColorByRating(rating, context);
        return Row(children: [
          Container(
            decoration: BoxDecoration(
              color: ratingColor.second,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ratingColor.main,
                ),
                Text(
                  '$rating ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                    color: ratingColor.main,
                  ),
                ),
                Text(
                  //Localizations.rating1,
                  state.bookingInformation!.ratingName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(
                    color: ratingColor.main,
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}

class _HotelName extends StatelessWidget {
  const _HotelName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.isInit == false)
          return const SizedBox.shrink(); //todo replace to skeleton
        return Text(state.bookingInformation!.hotelName,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium);
      },
    );
  }
}

class _HotelAddress extends StatelessWidget {
  const _HotelAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state.isInit == false) return const SizedBox.shrink(); //todo replace to skeleton
          return Text(state.bookingInformation!.hotelAddress,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.blue));
        });
  }
}