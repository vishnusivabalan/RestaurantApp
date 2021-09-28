import 'package:flutter/material.dart';
import 'package:sample/orderScreen.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'constants.dart';
import 'detailScreen.dart';
import 'LocationScreen.dart';
void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
