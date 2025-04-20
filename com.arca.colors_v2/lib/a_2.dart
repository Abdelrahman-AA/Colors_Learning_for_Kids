import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:colors_v2/home.dart';
import 'package:colors_v2/name.dart';
import 'package:colors_v2/panner_ad.dart';
import 'package:flutter/material.dart';

import 'package:wakelock/wakelock.dart';
// import 'package:flutter/scheduler.dart';

// late List<Widget> s;
AssetsAudioPlayer player = AssetsAudioPlayer();
int x2 = 0;
int k2 = 1;

// DateTime end = DateTime.now();

class A_2 extends StatefulWidget {
  const A_2({super.key});

  @override
  State<A_2> createState() => A_2State();
}

class A_2State extends State<A_2> {
  //
  void toast3(
    BuildContext context,
  ) {}

  Future<bool> _exet3(BuildContext context) async {
    player.stop();

    x2 = 2;
    k2 = 0;
    Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);

    return false;
  }

  @override
  void initState() {
    Wakelock.enable();

    // if (x != 2) {
    player.open(
      Playlist(audios: [
        Audio("audio2/s1.mp3"),
        Audio("audio2/$t.mp3"),
        Audio("audio2/s2.mp3"),
        Audio("audio2/$t.mp3"),
        Audio("audio2/s2.mp3"),
        Audio("audio2/$t.mp3"),
        Audio("audio2/s2.mp3")
      ]),
    );
    // player.playlistAudioFinished;
    // player.playlistAudioFinished.listen((AudioFinished) {
    //   print(
    //       "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    // });
    Timer.run(() {
      go() {
        if (x2 != 2) {
          if (swit) {
            if (t < n) {
              t = ++t;
              Navigator.of(context).pushNamed("a_1");
            } else if (t == n) {
              t = 1;
              Navigator.of(context).pushNamed("a_1");
            }
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("home", (route) => false);
          }
        } else {
          x2 = 0;
        }
        k2 = 1;
      }

      Timer togo([int milliseconds = 9000]) =>
          Timer(Duration(milliseconds: milliseconds), go);

      togo();
    });

    x2 = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exet3(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(name[t]),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 73, 36, 61),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          backgroundColor: Color.fromARGB(255, 243, 188, 218),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(bottom: 60),
              color: Color.fromARGB(255, 248, 243, 230),
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("gifs/${t}.gif"), fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Stack(children: [
                Container(
                  color: Color.fromARGB(255, 243, 188, 218),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  left: (((MediaQuery.of(context).size.width) - scc) / 2),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const Adpanner(),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
