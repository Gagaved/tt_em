part of 'rooms_page.dart';

class _RoomPhotoCarousel extends StatelessWidget {
  const _RoomPhotoCarousel({required this.imageRefs});
  final List<String> imageRefs;
  @override
  Widget build(BuildContext context) {
        return PhotoCarousel(imageRefs: imageRefs,);
  }
}
