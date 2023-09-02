part of 'hotel_page.dart';

class _HotelPhotoCarousel extends StatelessWidget {
  const _HotelPhotoCarousel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state.isInit == false) return const SizedBox.shrink();
        return PhotoCarousel(
          imageRefs: state.hotel!.imageUrls,
        );
      },
    );
  }
}

class _GoToRoomSelectionButton extends StatelessWidget {
  const _GoToRoomSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state.isInit == false) return const SizedBox.shrink();//todo replace to skeleton
          return ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return RoomsPage(
                  hotel: state.hotel!,
                );
              }));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.goToRoomSelection,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )),
            ),
          );
        },
      ),
    );
  }
}
