import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/payment/payment_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/widgets/app_content_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key, this.args}) : super(key: key);
  final Object? args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Заказ оплачен',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: const _SussesPay(),
      ),
    );
  }
}

class _SussesPay extends StatelessWidget {
  const _SussesPay();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: AppContentCard(
            roundedTopBorder: false,
            roundedBottomBorder: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SussesImage(),
                SizedBox(
                  height: 40,
                ),
                _SussesTitle(),
                SizedBox(
                  height: 20,
                ),
                _SussesBookingInfo(),
              ],
            ),
          ),
        ),
        _SussesButton(),
      ],
    );
  }
}

class _SussesButton extends StatelessWidget {
  const _SussesButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state.isInit == false) return const SizedBox.shrink();
        return AppContentCard(
          roundedBottomBorder: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 20),
            child: ElevatedButton(
                onPressed: () {

                  Navigator.of(context).popUntil((route) => route.isFirst);

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.sussesPaymentButton,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    )))),
          ),
        );
      },
    );
  }
}

class _SussesImage extends StatelessWidget {
  const _SussesImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle),
      child: Center(
        child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/party_popper.png')),
      ),
    );
  }
}

class _SussesTitle extends StatelessWidget {
  const _SussesTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ваш заказ принят в работу',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _SussesBookingInfo extends StatelessWidget {
  const _SussesBookingInfo();

  @override
  Widget build(BuildContext context) {
    String string;
    String ls = AppLocalizations.of(context)!.sussesPaymentInfo;
    try {
      string = ls.substring(0, 22) + 104893.toString() + ls.substring(22);
    } catch (_) {
      string = ls;
    }
    return Center(
      child: Text(
        string,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.textGrayColor, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }
}
