import 'package:flutter/material.dart';

class ApartmentsPage extends StatelessWidget {
  const ApartmentsPage({Key? key, this.args}) : super(key: key);
  final Object? args;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Steigenberger Makadi',style: Theme.of(context).textTheme.titleSmall,),centerTitle: true,),
      body: Center(child: Text('ApartmentsPage'),),
    );
  }
}
