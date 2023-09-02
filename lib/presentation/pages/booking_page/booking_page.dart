import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/booking/booking_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/utils/color_by_rating.dart';
import 'package:tt_em/presentation/widgets/content_holder.dart';

part 'hotel_information.dart';
part 'booking_information.dart';
class BookingPage extends StatelessWidget {
  const BookingPage({Key? key, required this.roomId}) : super(key: key);
  final int roomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc(roomId),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.bookingPageTitle,
              style: Theme.of(context).textTheme.titleSmall!),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            _HotelInformation(),
            SizedBox(height: 10,),
            _BookingInformation(),
            //_BuyerInformation(),
            //_TouristsList(),
            //_Prices(),
            //_BuyButton(),
          ],
        ),
      ),
    );
  }
}
