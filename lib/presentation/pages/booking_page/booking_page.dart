
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/booking/booking_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/utils/color_by_rating.dart';
import 'package:tt_em/presentation/utils/lacalization.dart';
import 'package:tt_em/presentation/widgets/app_content_card.dart';

part 'hotel_information.dart';
part 'booking_information.dart';
part 'buyer_information.dart';
part 'tourists_list.dart';
class BookingPage extends StatelessWidget {
  const BookingPage({Key? key, required this.roomId}) : super(key: key);
  final int roomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc(roomId),
      child: Unfocuser(
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
          body: ListView(
            children: [
              const SizedBox(height: 10,),
              const _HotelInformation(),
              const SizedBox(height: 10,),
              const _BookingInformation(),
              SizedBox(height: 10,),
              _BuyerInformation(),
              const SizedBox(
                height: 10,
              ),
              _TouristsList(),
              //_Prices(),
              //_BuyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
