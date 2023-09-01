import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_em/domain/model/room.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/bloc/rooms/rooms_bloc.dart';
import 'package:tt_em/presentation/constants/colors.dart';
import 'package:tt_em/presentation/widgets/content_holder.dart';
import 'package:tt_em/presentation/widgets/peculiar.dart';
import 'package:tt_em/presentation/widgets/photo_carousel.dart';

part 'room_photo_carousel.dart';



class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key, this.args}) : super(key: key);
  final Object? args;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomsBloc(),
      child: Scaffold(
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: BlocBuilder<RoomsBloc, RoomsState>(
              builder: (context, state) {
                if(state.isInit==false)return const SizedBox.shrink();
                return Text(
                  state.hotel!.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 1),maxLines: 2,
                );
              },
            ),
            centerTitle: true,
          ),
        ),
        body: BlocBuilder<RoomsBloc, RoomsState>(
          builder: (context, state) {
            if (state.isInit == false) {
              return const SizedBox.shrink();
            }
            return ListView.builder(
                itemCount: state.rooms!.length,
                itemBuilder: (context, index) {

              return Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,((state.rooms!.length-1)==index)?20.0:10),
                child: _RoomCard(
                  room: state.rooms![index],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentHolder(
            roundedBottomBorder: false,
            roundedTopBorder: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: _RoomPhotoCarousel(
                    imageRefs: room.imageUrls,
                  ),
                ),
                _RoomInformation(
                  room: room,
                ),
                const _GoToBookingButton()
              ],
            )),
      ],
    );
  }
}


class _GoToBookingButton extends StatelessWidget {
  const _GoToBookingButton();

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/booking');
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
                AppLocalizations.of(context)!.goToBookingButton,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              )),
        ),
      ),
    );
  }
}

class _RoomInformation extends StatelessWidget {
  const _RoomInformation({Key? key, required this.room}) : super(key: key);
  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _RoomName(name: room.name),
        const SizedBox(height: 10),
        _Peculiarities(
          peculiarities: room.peculiarities,
        ),
        const _MoreAboutRoomButton(),
        const SizedBox(height: 10),
        _Price(price: room.price, pricePer: room.pricePer),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({Key? key, required this.price, required this.pricePer})
      : super(key: key);
  final int price;
  final String pricePer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$price ₽',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(pricePer,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.textGrayColor, height: 1)),
        )),
      ],
    );
  }
}

class _Peculiarities extends StatelessWidget {
  const _Peculiarities({Key? key, required this.peculiarities})
      : super(key: key);
  final List<String> peculiarities;

  @override
  Widget build(BuildContext context) {
    List<Widget> peculiaritiesWidgets = peculiarities
        .map(
          (e) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: Peculiar(text: e),
          ),
        )
        .toList();
    return Wrap(children: peculiaritiesWidgets);
  }
}

class _RoomName extends StatelessWidget {
  const _RoomName({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(name ?? '', style: Theme.of(context).textTheme.titleMedium);
  }
}


class _MoreAboutRoomButton extends StatelessWidget {
  const _MoreAboutRoomButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(7),
                  bottom: Radius.circular(7),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.moreAboutRoom,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3,0,3,0),
                    child: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
