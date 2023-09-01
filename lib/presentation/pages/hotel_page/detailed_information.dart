part of 'hotel_page.dart';

class _DetailedInformation extends StatelessWidget {
  const _DetailedInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentHolder(
      roundedTopBorder: true,
      roundedBottomBorder: true,
      child: Container(
        alignment: Alignment.topLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            _Title(),
            _Peculiarities(),
            SizedBox(
              height: 10,
            ),
            _Description(),
            SizedBox(
              height: 20,
            ),
            _DescriptionButtons(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Об отеле',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _Peculiarities extends StatelessWidget {
  const _Peculiarities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: Peculiar(text: '3-я линия'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: Peculiar(text: 'Платный Wi-Fi в фойе'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: Peculiar(text: '30 км до аэропорта'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: Peculiar(text: '1 км до пляжа'),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
        style: Theme.of(context).textTheme.bodyMedium!,
      ),
    );
  }
}

class _DescriptionButtons extends StatelessWidget {
  const _DescriptionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.peculiaritiesLightGrayColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15),
          )),
      child: Column(
        children: [
          _DescriptionButton(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50,0,32,0),
                child: Container(height: 2,color: AppColors.backgroundColor,),
              ),
          _DescriptionButton(),
          Container(height: 1,color: AppColors.backgroundColor,),
          _DescriptionButton()
        ],
      ),
    );
  }
}

class _DescriptionButton extends StatelessWidget {
  const _DescriptionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.ios_share_sharp),
      title: Text('title', style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text('subtitle',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.textGrayColor)),

    trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
