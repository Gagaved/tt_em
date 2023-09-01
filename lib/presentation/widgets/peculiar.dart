import 'package:flutter/material.dart';
import 'package:tt_em/presentation/constants/colors.dart';

class Peculiar extends StatelessWidget {
  final String text;

  const Peculiar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.peculiaritiesLightGrayColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(5),
            bottom: Radius.circular(5),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.textGrayColor),
        ),
      ),
    );
  }
}
