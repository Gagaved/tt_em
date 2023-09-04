import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tt_em/domain/model/hotel.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/models/hotel_mock_extension.dart';
import 'package:tt_em/presentation/pages/rooms_page/rooms_page.dart';
import 'package:tt_em/presentation/utils/color_by_rating.dart';
import 'package:tt_em/presentation/utils/price_number_format.dart';
import 'package:tt_em/presentation/widgets/app_content_card.dart';
import 'package:tt_em/presentation/widgets/peculiar.dart';
import 'package:tt_em/presentation/widgets/photo_carousel.dart';

part 'detailed_information.dart';

part 'main_information.dart';

part 'hotel_photo_carousel.dart';
class HotelPage extends StatelessWidget {
  const HotelPage({Key? key, this.args}) : super(key: key);
  final Object? args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.hotelPageTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        //Localizations.hotelPageTitle
        body: const SingleChildScrollView(
          child: Column(
            children: [
              _HotelPhotoCarousel(),
              _MainInformation(),
              SizedBox(
                height: 12,
              ),
              _DetailedInformation(),
              SizedBox(
                height: 12,
              ),
              AppContentCard(
                  roundedTopBorder: false,
                  roundedBottomBorder: false,
                  child: _GoToRoomSelectionButton()),
            ],
          ),
        ),
      ),
    );
  }
}


class _GoToRoomSelectionButton extends StatelessWidget {
  const _GoToRoomSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state.isInit == false) return const SizedBox.shrink();//todo replace to skeleton
          return ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return RoomsPage(
                  hotel: state.hotel!,
                );
              }));
            },
            // style: ElevatedButton.styleFrom(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15), // <-- Radius
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.goToRoomSelection,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  )),
            ),
          );
        },
      ),
    );
  }
}
