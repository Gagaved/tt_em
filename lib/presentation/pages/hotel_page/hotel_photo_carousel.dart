part of 'hotel_page.dart';

class _HotelPhotoCarousel extends StatelessWidget {
  const _HotelPhotoCarousel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        Hotel hotel = HotelMockExtension.createMock();
        bool enabledSkeletonizer = true;
        if (state.isInit == true) {
          enabledSkeletonizer = false;
          hotel = state.hotel!;
        }
        if(hotel.imageUrls.isEmpty)return SizedBox.shrink();
        return Skeletonizer(
          enabled: enabledSkeletonizer,
          child: AppContentCard(
            roundedBottomBorder: false,
            roundedTopBorder: false,
            child: PhotoCarousel(
              imageRefs: hotel.imageUrls,
            ),
          ),
        );
      },
    );
  }
}