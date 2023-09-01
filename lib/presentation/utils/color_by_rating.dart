import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_em/presentation/theme/theme.dart';

final class RatingColor {


  final Color main;
  final Color second;

  RatingColor(this.main, this.second);
}

getColorByRating(int rating,
    BuildContext context) {
  switch (rating) {
    case 1:
      throw Exception('unimplemented rating color: ${1}');
    case 2:
      throw Exception('unimplemented rating color: ${1}');
    case 3:
      throw Exception('unimplemented rating color: ${1}');
    case 4:
      throw Exception('unimplemented rating color: ${1}');
    case 5:
      return RatingColor(Theme.of(context).extension<RatingStyle>()!.main5, Theme.of(context).extension<RatingStyle>()!.second5);
  }
}