import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/constants/colors.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({Key? key, required this.imageRefs}) : super(key: key);
  final List<String> imageRefs;

  @override
  State<StatefulWidget> createState() {
    return _PhotoCarouselState();
  }
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 300,
                viewportFraction: 1.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                enlargeFactor: 0,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: widget.imageRefs
                .map((refs) => CachedNetworkImage(
                      imageUrl: refs,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                              child: Center()),
                      errorWidget: (context, url, error) => Center(
                          child: Text(
                        AppLocalizations.of(context)!.loadImageErrorMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.textGrayColor),
                      )),
                    ))
                .toList(),
          ),
          Skeleton.ignore(
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.imageRefs.asMap().entries.map((entry) {
                        int dif = (_current - entry.key);
                        double opacity;
                        if (dif == 0) {
                          opacity = 1;
                        } else {
                          opacity = 1 / (dif.abs() + 2);
                        }
                        //print(opacity);
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(opacity)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
