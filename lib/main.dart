import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './FormModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Milk Quality Predictor',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Roboto-Medium'
        ),
        home: HomePage(),
        initialRoute: '/',
        routes: {
          FormModel.routeName : (context) => FormModel()
        }
    );
  }
}
