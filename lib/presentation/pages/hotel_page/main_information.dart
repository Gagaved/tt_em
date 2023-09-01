part of 'hotel_page.dart';

class _MainInformation extends StatelessWidget {
  const _MainInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContentHolder(
      roundedTopBorder: false,
      roundedBottomBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,10.0,0,0),
            child: _Rating(
              rating: 5,
            ),
          ),
          _HotelName(),
          _HotelAddress(),
          _MinimalPrice(),
        ],
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({Key? key, required this.rating}) : super(key: key);
  final int rating;

  @override
  Widget build(BuildContext context) {
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
              size: 20,
              color: ratingColor.main,
            ),
            Text(
              rating.toString(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ratingColor.main,
              ),
            ),
            Text(
              //Localizations.rating1,
              ' Превосходно',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: ratingColor.main,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class _HotelName extends StatelessWidget {
  const _HotelName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'Steigenberger Makadi',
        style: Theme.of(context).textTheme.titleMedium);
  }
}

class _HotelAddress extends StatelessWidget {
  const _HotelAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue));
  }
}

class _MinimalPrice extends StatelessWidget {
  const _MinimalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('от 134 673 ₽',style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(width: 10,),
        Expanded(child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('за тур с перелетом'
              ,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textGrayColor,height: 1)),
        )),
      ],
    );
  }
}
