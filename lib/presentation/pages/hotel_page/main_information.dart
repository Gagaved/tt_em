part of 'hotel_page.dart';

class _MainInformation extends StatelessWidget {
  const _MainInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      roundedTopBorder: false,
      roundedBottomBorder: true,
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          Hotel hotel = HotelMockExtension.createMock();
          bool enabledSkeletonizer = true;
          if (state.isInit == true) {
            enabledSkeletonizer = false;
            hotel = state.hotel!;
          }
          return Skeletonizer(
            enabled: enabledSkeletonizer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _Rating(rating: hotel.rating,ratingName: hotel.ratingName),
                const SizedBox(height: 10),
                _HotelName(name:hotel.name),
                const SizedBox(height: 10),
                _HotelAddress(address:hotel.address),
                const SizedBox(height: 10),
                _MinimalPrice(minimalPrice:hotel.minimalPrice, priceForIt: hotel.priceForIt,),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({Key? key, required this.rating, required this.ratingName}) : super(key: key);
  final int rating;
  final String ratingName;
  @override
  Widget build(BuildContext context) {
        RatingColor ratingColor = getColorByRating(rating, context);
        return Row(children: [
          Skeleton.unite(
            child: Container(
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
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ratingColor.main,
                        ),
                  ),
                  Text(
                    //Localizations.rating1,
                    ratingName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ratingColor.main,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}

class _HotelName extends StatelessWidget {
  const _HotelName({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: Theme
            .of(context)
            .textTheme
            .titleMedium);
  }
}
class _HotelAddress extends StatelessWidget {
  const _HotelAddress({Key? key, required this.address}) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context) {
      return Text(address,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.blue));}}

class _MinimalPrice extends StatelessWidget {
  const _MinimalPrice({Key? key, required this.minimalPrice, required this.priceForIt}) : super(key: key);
  final int minimalPrice;
  final String priceForIt;
  @override
  Widget build(BuildContext context) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${AppLocalizations.of(context)!.fromPrice} ${priceNumberFormat(minimalPrice)} ₽',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Skeleton.ignore(
                child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(priceForIt,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.textGrayColor, height: 1)),
          ),
              )),
        ],
      );
  }
}
