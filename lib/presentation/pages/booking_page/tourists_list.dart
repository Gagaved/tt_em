part of 'booking_page.dart';

class _TouristInformation extends StatelessWidget {
  const _TouristInformation({super.key, required this.touristNumber});

  final int touristNumber;

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                getTouristTitleLocalization(touristNumber, context),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              const _Button()
            ],
          ),
          const SizedBox(
            height: 65,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.blue.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), // <-- Radius
            ),
          ),
          onPressed: () {},
          icon  : Container(
            //color: Colors.red,
            child: RotatedBox(
                quarterTurns: 1, child: Icon(
                Icons.arrow_forward_ios,
            size: 20,
            )),
          )));
  }
}

class _TouristsList extends StatelessWidget {
  const _TouristsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [_TouristInformation(touristNumber: 1)],
    );
  }
}
