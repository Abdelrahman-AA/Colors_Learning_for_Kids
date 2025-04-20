import 'dart:async';

import 'package:colors_v2/a_1.dart';
import 'package:colors_v2/a_2.dart';
import 'package:colors_v2/name.dart';
import 'package:colors_v2/panner_ad2.dart';
import 'package:colors_v2/panner_ad.dart';

import 'package:colors_v2/temp.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wakelock/wakelock.dart';

bool on = true;

int n = 12;
late int c;
late int t;
bool swit = false;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  void toast1(
    BuildContext context,
  ) {}

  Future<bool> _exet1(BuildContext context) async {
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
    super.initState();
  }

  @override
  void dispose() {
    // x = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exet1(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text(name[0]),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 73, 36, 61),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            backgroundColor: Color.fromARGB(255, 243, 188, 218),
          ),
          drawer: Drawer(
              child: Container(
                  color: Color.fromARGB(255, 243, 188, 218),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "خـيــارات",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 73, 36, 61),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 84, 191, 139)
                                      .withOpacity(.5),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 84, 191, 139),
                                      width: 0),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 4, 56, 6)
                                            .withOpacity(.2),
                                        offset: Offset(-1, 1))
                                  ]),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image(
                                            image:
                                                AssetImage("images/anim.png")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "الحيوانات والحروف",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 73, 36, 61),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor: Color.fromARGB(
                                                      255, 240, 250, 255)
                                                  .withOpacity(.85),
                                              content: Text(
                                                "إطلع على برامجنا التعليمية الاخرى المقدمة من\n ARCA Software\nعلى\nplay store",
                                                textAlign: TextAlign.center,
                                              ),
                                              contentTextStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 73, 36, 61),
                                                  fontSize: 17),
                                            );
                                          }));
                                    },
                                  )
                                ],
                              ),
                            )
                            // Row(
                            //   children: [
                            //     Card(
                            //       child: Image(
                            //           height: 70,
                            //           // width: ,
                            //           image: AssetImage("images/logo.png")),
                            //     )
                            //   ],
                            // ),
                            // Container(
                            //     // color: Color.fromARGB(255, 4, 56, 6),
                            //     // Color.fromARGB(255, 4, 56, 6)
                            //     //  Colors.greenAccent
                            //     // child: InkWell(),
                            //     ),
                          ],
                        ),
                        Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Switch(
                                    activeColor:
                                        Color.fromARGB(255, 73, 36, 61),
                                    value: swit,
                                    onChanged: (value) async {
                                      if (value == true) {
                                        swit = true;
                                      } else {
                                        swit = false;
                                      }
                                      await loadAd();
                                      setState(() {});
                                      swit = value;
                                    }),
                                const Text(
                                  "تشغيل تلقائي متتابع",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 73, 36, 61)),
                                ),
                              ]),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image(image: AssetImage("images/a.png"))),
                              Text(
                                "ARCA software",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ])
                      ]))),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                color: Color.fromARGB(255, 248, 243, 230),
                child: Stack(
                  children: [
                    Container(
                        padding: EdgeInsetsDirectional.only(bottom: 60),
                        child: GridView(
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, childAspectRatio: .75),
                            children: [
                              GridView.builder(
                                  itemCount: n,
                                  padding: EdgeInsets.all(10),
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    c = index + 1;
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: mycolor[index],
                                          border: Border.all(
                                              width: 0, color: mycolor[index]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                      255, 73, 36, 61)
                                                  .withOpacity(.7),
                                              offset: Offset(-2, 2),
                                              blurRadius: 2,
                                              spreadRadius: 2,
                                            )
                                          ]),
                                      // child: Card(
                                      //   // color: mycolor[index],
                                      //   elevation: 10,
                                      //   shadowColor:
                                      //       Color.fromARGB(255, 73, 36, 61),
                                      child: InkWell(
                                        onTap: () {
                                          if (k == 1) {
                                            t = index + 1;
                                            Timer.run(() {
                                              handleTimeout() {
                                                Navigator.of(context)
                                                    .pushNamed("a_1");
                                              }

                                              Timer scheduleTimeout(
                                                      [int milliseconds =
                                                          500]) =>
                                                  Timer(
                                                      Duration(
                                                          milliseconds:
                                                              milliseconds),
                                                      handleTimeout);
                                              scheduleTimeout();
                                            });
                                          } else if (k != 1 && k2 == 1) {
                                            t = index + 1;
                                            Timer.run(() {
                                              handleTimeout() {
                                                Navigator.of(context)
                                                    .pushNamed("a_2");
                                              }

                                              Timer scheduleTimeout(
                                                      [int milliseconds =
                                                          500]) =>
                                                  Timer(
                                                      Duration(
                                                          milliseconds:
                                                              milliseconds),
                                                      handleTimeout);
                                              scheduleTimeout();
                                            });
                                          } else {
                                            t = index + 1;
                                            Timer.run(() {
                                              handleTimeout() {
                                                Navigator.of(context)
                                                    .pushNamed("a_3");
                                              }

                                              Timer scheduleTimeout(
                                                      [int milliseconds =
                                                          500]) =>
                                                  Timer(
                                                      Duration(
                                                          milliseconds:
                                                              milliseconds),
                                                      handleTimeout);
                                              scheduleTimeout();
                                            });
                                          }
                                        },
                                      ),
                                      // ),
                                    );
                                  }),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: const Adpanner2(),
                                  ),
                                ],
                              ),
                            ])),
                    Positioned(
                      bottom: 0,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(.6))
                            ],
                            color: Color.fromARGB(255, 243, 188, 218),
                          ),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          bottom: 0,
                          left:
                              (((MediaQuery.of(context).size.width) - scc) / 2),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Adpanner(),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ))),
    );
  }
}
