import 'package:colors_v2/a_1.dart';
import 'package:colors_v2/a_2.dart';
import 'package:colors_v2/a_3.dart';
import 'package:colors_v2/home.dart';
import 'package:colors_v2/temp.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Temp(),
      routes: {
        "home": (context) => Home(),
        "a_1": (context) => A_1(),
        "a_2": (context) => A_2(),
        "a_3": (context) => A_3(),
        "temp": (context) => Temp(),
      },
    );
  }
}
