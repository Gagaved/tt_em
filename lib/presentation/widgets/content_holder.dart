import 'package:flutter/material.dart';

class ContentHolder extends StatelessWidget {
  const ContentHolder(
      {Key? key,
      this.child,
      this.roundedTopBorder = true,
      this.roundedBottomBorder = true})
      : super(key: key);
  final Widget? child;
  final bool roundedTopBorder;
  final bool roundedBottomBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: roundedTopBorder ? const Radius.circular(12) : Radius.zero,
            bottom:
                roundedBottomBorder ? const Radius.circular(12) : Radius.zero,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: child,
      ),
    );
  }
}
