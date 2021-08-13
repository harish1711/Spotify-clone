import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:like_button/like_button.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:spotify/main.dart';
import 'package:spotify/model/user.dart';
import 'package:spotify/test.dart';
import 'model/user.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideDownRoute extends PageRouteBuilder {
  final Widget page;
  SlideDownRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class Musicplayer extends StatefulWidget {
  Musicplayer({Key key}) : super(key: key);

  @override
  _MusicplayerState createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> images = [
    'assets/images/adhi.jpg',
    'assets/images/suriya.jpg',
    'assets/images/rakita.jpg',
    'assets/images/sid.jpg',
    'assets/images/ilaya.jpg',
    'assets/images/psyho.jpg',
  ];
  double _value;
  _HomepageState({
    Key key,
  }) {
    this._value = 0.00;
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // double _lowerValue = 0.0;
    // double _upperValue = 100.0;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage(images[5]),
                  fit: BoxFit.cover,
                ),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.red.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.keyboard_arrow_down),
                          onPressed: () {
                            Navigator.push(
                                context, SlideDownRoute(page: MyHomePage()));
                          }),
                      Container(
                        width: width - 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "PLAYING FROM ALBUM",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              minFontSize: 10,
                            ),
                            Center(
                              child: AutoSizeText(
                                "Kathi",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Navigator.push(
                                context, SlideDownRoute(page: MyHomePage()));
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Container(
                  height: height * 0.40,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: height * 0.40, maxWidth: width * 0.80),
                    child: Image.asset(images[5], fit: BoxFit.fill),
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: MarqueeWidget(
                                      text:
                                          "Sword of Destiny . Anirudh Ravichander",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Sword of Destiny . Anirudh Ravichander",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 15.0),
                              child: Container(
                                padding: EdgeInsets.only(right: 5.0),
                                child: LikeButton(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Slider(
                            min: 0,
                            max: 4,
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value.roundToDouble();
                              });
                            },
                          ),
                        ),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('$_value'), Text('$_value')],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 25,
                        color: Colors.white,
                        icon: Icon(Icons.shuffle),
                        onPressed: () {}),
                    IconButton(
                      iconSize: 35,
                      color: Colors.white,
                      icon: Icon(Icons.navigate_before),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 50,
                      color: Colors.white,
                      icon: Icon(Icons.play_circle_filled),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 35,
                      color: Colors.white,
                      icon: Icon(Icons.navigate_next),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 25,
                      color: Colors.white,
                      icon: Icon(Icons.repeat),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 12.0, left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 25,
                        color: Colors.white,
                        icon: Icon(Icons.repeat),
                        onPressed: () {},
                      ),
                      IconButton(
                        iconSize: 25,
                        color: Colors.white,
                        icon: Icon(Icons.repeat),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
