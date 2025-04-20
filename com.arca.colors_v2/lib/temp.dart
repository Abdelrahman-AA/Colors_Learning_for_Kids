import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wakelock/wakelock.dart';

late String open_ad_id;

AppOpenAd? adopen;
Future<void> loadAd() async {
  if (test_app) {
    open_ad_id = 'ca-app-pub- ---/---';
  } else {
    open_ad_id = 'ca-app-pub- ---/---';
  }
  await AppOpenAd.load(
      adUnitId: open_ad_id,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        adopen = ad;
        adopen!.show();
      }, onAdFailedToLoad: (error) {
        print('ad faild to load $error');
      }),
      orientation: AppOpenAd.orientationPortrait);
}

var wid = Container();

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  void toast(
    BuildContext context,
  ) {}

  Future<bool> _exet(BuildContext context) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor:
                Color.fromARGB(255, 240, 250, 255).withOpacity(.85),
            content: Text(
              "إضغط هنا للخروج",
              textAlign: TextAlign.center,
            ),
            contentTextStyle:
                TextStyle(color: Color.fromARGB(255, 73, 36, 61), fontSize: 17),
            actions: [
              Container(
                alignment: Alignment.center,
                child: IconButton(
                    iconSize: 37,
                    onPressed: () async {
                      SystemNavigator.pop();
                    },
                    icon: Icon(Icons.logout)),
              )
            ],
          );
        }));

    return true;
  }

  @override
  void initState() {
    Wakelock.enable();
    Timer.run(() {
      handleTimeout2() {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      }

      handleTime1() {
        setState(() {
          wid = Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                    opacity: .2,
                    fit: BoxFit.contain)),
          );
        });
      }

      handleTime2() {
        setState(() {
          wid = Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                    opacity: .4,
                    fit: BoxFit.contain)),
          );
        });
      }

      handleTime3() {
        setState(() {
          wid = Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                    opacity: .6,
                    fit: BoxFit.contain)),
          );
        });
      }

      handleTime4() {
        setState(() {
          wid = Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                    opacity: .8,
                    fit: BoxFit.contain)),
          );
        });
      }

      handleTime5() {
        setState(() {
          wid = Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo2.png"),
                    fit: BoxFit.contain)),
          );
        });
      }

      Timer scheduleTimeouut([int milliseconds = 8500]) =>
          Timer(Duration(milliseconds: milliseconds), handleTimeout2);
      Timer scheduleTime1([int milliseconds = 5000]) =>
          Timer(Duration(milliseconds: milliseconds), handleTime1);
      Timer scheduleTime2([int milliseconds = 5500]) =>
          Timer(Duration(milliseconds: milliseconds), handleTime2);
      Timer scheduleTime3([int milliseconds = 6000]) =>
          Timer(Duration(milliseconds: milliseconds), handleTime3);
      Timer scheduleTime4([int milliseconds = 6500]) =>
          Timer(Duration(milliseconds: milliseconds), handleTime4);
      Timer scheduleTime5([int milliseconds = 7000]) =>
          Timer(Duration(milliseconds: milliseconds), handleTime5);
      scheduleTimeouut();
      scheduleTime1();
      scheduleTime2();
      scheduleTime3();
      scheduleTime4();
      scheduleTime5();
    });
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exet(context),
      child: Center(
        child: Container(
          color: Color.fromARGB(255, 240, 250, 255),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("gifs/100.gif"),
                        fit: BoxFit.contain)),
              ),
              wid,
            ],
          ),
        ),
      ),
    );
  }
}
