part of 'hotel_page.dart';

class _DetailedInformation extends StatelessWidget {
  const _DetailedInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        Hotel hotel = HotelMockExtension.createMock();
        bool enabledSkeletonizer = true;
        if (state.isInit == true) {
          enabledSkeletonizer = false;
          hotel = state.hotel!;
        }
        return AppContentCard(
          roundedTopBorder: true,
          roundedBottomBorder: true,
          child: Container(
            alignment: Alignment.topLeft,
            child: Skeletonizer(
              enabled: enabledSkeletonizer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  _Title( name: hotel.name,),
                  _Peculiarities(peculiarities: hotel.aboutTheHotel.peculiarities,),
                  SizedBox(
                    height: 17,
                  ),
                  _Description(
                    text: hotel.aboutTheHotel.description,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  const _DescriptionButtons(),
                  SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required String name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.hotelDetailedInformationTitle,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _Peculiarities extends StatelessWidget {
  const _Peculiarities({Key? key, required this.peculiarities})
      : super(key: key);
  final List<String> peculiarities;

  @override
  Widget build(BuildContext context) {
    List<Widget> peculiaritiesW = peculiarities
        .map(
          (e) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: Skeleton.unite(child: Peculiar(text: e)),
          ),
        )
        .toList();
    return Wrap(children: peculiaritiesW);
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!,
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
            leading:Image.asset('assets/close_square.png'),
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
            leading:Image.asset('assets/emoji_happy.png'),
            title: AppLocalizations.of(context)!.whatIsIncluded,
            subtitle: AppLocalizations.of(context)!.essentials,
          ),
          Container(
            height: 1,
            color: AppColors.backgroundColor,
          ),
          _DescriptionButton(
            leading:Image.asset('assets/tick_square.png'),
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
      {Key? key, required this.title, required this.subtitle, required this.leading})
      : super(key: key);
  final String title;
  final String subtitle;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 30,
          height: 30,
          child: leading),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.textGrayColor)),
      trailing: const Skeleton.ignore(child: Icon(Icons.arrow_forward_ios)),
    );
  }
}
