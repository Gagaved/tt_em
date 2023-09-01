import 'package:flutter/material.dart';

class PhotoCarousel extends StatelessWidget {
  const PhotoCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.grey),
    );
  }
}