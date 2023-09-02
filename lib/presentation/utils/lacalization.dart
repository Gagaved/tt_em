import 'package:flutter/cupertino.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';

String getTouristTitleLocalization(int touristNumber,BuildContext context) {

  switch (touristNumber) {
    case 1:
      return AppLocalizations.of(context)!.touristTitle1;
    case 2:
      return AppLocalizations.of(context)!.touristTitle2;
    case 3:
      return AppLocalizations.of(context)!.touristTitle3;
    case 4:
      return AppLocalizations.of(context)!.touristTitle4;
    case 5:
      return AppLocalizations.of(context)!.touristTitle5;
    case 6:
      return AppLocalizations.of(context)!.touristTitle6;
    case 7:
      return AppLocalizations.of(context)!.touristTitle7;
    case 8:
      return AppLocalizations.of(context)!.touristTitle8;
    case 9:
      return AppLocalizations.of(context)!.touristTitle9;
    case 10:
      return AppLocalizations.of(context)!.touristTitle10;
  }
  return "${AppLocalizations.of(context)!.touristTitle} $touristNumber";

}