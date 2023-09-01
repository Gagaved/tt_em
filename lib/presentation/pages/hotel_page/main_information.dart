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
          SizedBox(height: 10),
          _Rating(),
          SizedBox(height: 10),
          _HotelName(),
          SizedBox(height: 10),
          _HotelAddress(),
          SizedBox(height: 10),
          _MinimalPrice(),
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
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state.isInit == false)
          return const SizedBox.shrink(); //todo replace to skeleton
        int rating = state.hotel!.rating;
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
                  state.hotel!.ratingName,
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
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state.isInit == false)
          return const SizedBox.shrink(); //todo replace to skeleton
        return Text(state.hotel!.name,
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
    return BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state.isInit == false) return const SizedBox.shrink(); //todo replace to skeleton
          return Text(state.hotel!.address,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.blue));
        });
  }
}

class _MinimalPrice extends StatelessWidget {
  const _MinimalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state)
    {
      if (state.isInit == false) return const SizedBox.shrink(); //todo replace to skeleton
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${AppLocalizations.of(context)!.fromPrice} ${state.hotel!
                .minimalPrice} ₽',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(state.hotel!.priceForIt,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.textGrayColor, height: 1)),
              )),
        ],
      );});
    }
  }
