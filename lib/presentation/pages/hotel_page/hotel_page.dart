import 'package:flutter/material.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/utils/color_by_rating.dart';
import 'package:tt_em/presentation/widgets/content_holder.dart';
import 'package:tt_em/presentation/widgets/peculiar.dart';
import 'package:tt_em/presentation/widgets/photo_carousel.dart';

part 'detailed_information.dart';

part 'main_information.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({Key? key, this.args}) : super(key: key);
  final Object? args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Отель',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      //Localizations.hotelPageTitle
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ContentHolder(
                roundedBottomBorder: false,
                roundedTopBorder: false,
                child: PhotoCarousel()),
            _MainInformation(),
            SizedBox(
              height: 12,
            ),
            _DetailedInformation(),
            SizedBox(
              height: 12,
            ),
            ContentHolder(
                roundedTopBorder: false,
                roundedBottomBorder: false,
                child: _GoToApartmentSelectionButton()),
          ],
        ),
      ),
    );
  }
}

class _GoToApartmentSelectionButton extends StatelessWidget {
  const _GoToApartmentSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/apartments');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // <-- Radius
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Center(
              child: Text(
            'К выбору номера',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
