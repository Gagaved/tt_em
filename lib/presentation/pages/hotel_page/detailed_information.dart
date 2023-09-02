part of 'hotel_page.dart';

class _DetailedInformation extends StatelessWidget {
  const _DetailedInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      roundedTopBorder: true,
      roundedBottomBorder: true,
      child: Container(
        alignment: Alignment.topLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 17,
            ),
            _Title(),
            _Peculiarities(),
            SizedBox(
              height: 10,
            ),
            _Description(),
            SizedBox(
              height: 20,
            ),
            _DescriptionButtons(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Об отеле',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _Peculiarities extends StatelessWidget {
  const _Peculiarities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state.isInit == false) {
          return const SizedBox.shrink(); //todo replace to skeleton
        }
        List<Widget> peculiarities = state.hotel!.aboutTheHotel.peculiarities
            .map(
              (e) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Peculiar(text: e),
              ),
            )
            .toList();
        return Wrap(children: peculiarities);
      },
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state.isInit == false) {
          return const SizedBox.shrink(); //todo replace to skeleton
        }
        return Text(
          state.hotel!.aboutTheHotel.description,
          style: Theme.of(context).textTheme.bodyMedium!,
        );
      },
    );
  }
}

class _DescriptionButtons extends StatelessWidget {
  const _DescriptionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.peculiaritiesLightGrayColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15),
          )),
      child: Column(
        children: [
          _DescriptionButton(
            title: AppLocalizations.of(context)!.amenities,
            subtitle: AppLocalizations.of(context)!.essentials,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 32, 0),
            child: Container(
              height: 1,
              color: AppColors.backgroundColor,
            ),
          ),
          _DescriptionButton(
            title: AppLocalizations.of(context)!.whatIsIncluded,
            subtitle: AppLocalizations.of(context)!.essentials,
          ),
          Container(
            height: 1,
            color: AppColors.backgroundColor,
          ),
          _DescriptionButton(
            title: AppLocalizations.of(context)!.whatIsNotIncluded,
            subtitle: AppLocalizations.of(context)!.essentials,
          ),
        ],
      ),
    );
  }
}

class _DescriptionButton extends StatelessWidget {
  const _DescriptionButton(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.ios_share_sharp),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.textGrayColor)),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
