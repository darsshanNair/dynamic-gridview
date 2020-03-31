import 'package:carsome_test/viewmodels/HomeViewModel.dart';
import 'package:carsome_test/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CarsomeTest());
}

class CarsomeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Carsome Test',
        home: Home(),
      ),
    );
  }
}
