part of 'booking_page.dart';

class _HotelInformation extends StatelessWidget {
  const _HotelInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppContentCard(
      roundedTopBorder: true,
      roundedBottomBorder: true,
      child: Center(
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
        BookingInformation bookingInformation = BookingInformationMockExtension.createMock();
        bool enabledSkeletonizer = true;
        if(state.isInit==true){
          enabledSkeletonizer= false;
          bookingInformation = state.bookingInformation!;
        }
        RatingColor ratingColor = getColorByRating(bookingInformation.rating, context);
        return Skeletonizer(
          //ignorePointers: true,
          enabled: enabledSkeletonizer,
          child: Skeleton.unite(
            child: Row(children: [
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
                      '${bookingInformation.rating} ',
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
                      bookingInformation.ratingName,
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
            ]),
          ),
        );
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
        BookingInformation bookingInformation = BookingInformationMockExtension.createMock();
        bool enabledSkeletonizer = true;
        if(state.isInit==true){
          enabledSkeletonizer= false;
          bookingInformation = state.bookingInformation!;
        }
        return Skeletonizer(
          justifyMultiLineText: true,
          enabled: enabledSkeletonizer,
          child: Text(bookingInformation.hotelName,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium),
        );
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
          BookingInformation bookingInformation = BookingInformationMockExtension.createMock();
          bool enabledSkeletonizer = true;
          if(state.isInit==true){
            enabledSkeletonizer= false;
            bookingInformation = state.bookingInformation!;
          }
          return Skeletonizer(
            enabled: enabledSkeletonizer,
            child: Text(bookingInformation.hotelAddress,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.blue)),
          );
        });
  }
}