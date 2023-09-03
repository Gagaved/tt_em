
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tt_em/domain/model/booking_information.dart';
import 'package:tt_em/domain/model/tourist.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/booking/booking_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/utils/color_by_rating.dart';
import 'package:tt_em/presentation/utils/date_formatter.dart';
import 'package:tt_em/presentation/utils/lacalization.dart';
import 'package:tt_em/presentation/utils/price_number_format.dart';
import 'package:tt_em/presentation/widgets/app_content_card.dart';
import 'package:tt_em/presentation/widgets/app_form.dart';
import 'package:tt_em/presentation/widgets/expanded_section.dart';
import 'package:tt_em/presentation/models/booking_info_mock_extension.dart';
part 'hotel_information.dart';
part 'booking_information.dart';
part 'buyer_information.dart';
part 'tourists_list.dart';
part 'prices_information.dart';
part 'buy_button.dart';
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
          body: const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                _HotelInformation(),
                SizedBox(height: 10,),
                _BookingInformation(),
                SizedBox(height: 10,),
                _BuyerInformation(),
                SizedBox(
                  height: 10,
                ),
                _TouristsList(),
                SizedBox(height: 10,),
                _PricesInformation(),
                SizedBox(height: 10,),
                _BuyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
