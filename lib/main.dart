import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:spotify/music.dart';

final userref = FirebaseFirestore.instance.collection("Users");
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Musicplayer(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    'assets/images/adhi.jpg',
    'assets/images/suriya.jpg',
    'assets/images/rakita.jpg',
    'assets/images/sid.jpg',
    'assets/images/ilaya.jpg',
    'assets/images/psyho.jpg',
  ];
  List<String> artist = [
    'Yuvan Shankar Raja ,sid sriram,G. V. Prakash ,Hip Hop',
  ];
  int index = 0;
  void inc() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        backgroundColor: Color(0xFF282828),
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.library_books), title: Text('library'))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(Icons.settings),
                            color: (Colors.white60),
                            onPressed: () {}),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Good evening",
                            style: GoogleFonts.cabin(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        child: Wrap(
                          spacing: 0.02,
                          direction: Axis.horizontal,
                          children: [
                            // ListTile(

                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/suriya.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Mass BGM/Themes",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width / 3.2,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/sid.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Tamil Melody Hits",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/rakita.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Latest Tamil",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/psyho.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Psycho(Tamil)",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.2,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/ilaya.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Tamil Melody",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 65,
                              child: Card(
                                elevation: 10,
                                color: Colors.black26,
                                child:
                                    LayoutBuilder(builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 60,
                                          maxWidth: 64,
                                          maxHeight: 64,
                                        ),
                                        child: Image.asset(
                                            'assets/images/adhi.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                      // Image.asset('assets/images/adhi.jpg',
                                      //     fit: BoxFit.cover),
                                      Container(
                                        padding: EdgeInsets.only(left: 5),
                                        width:
                                            isPortrait == Orientation.portrait
                                                ? constraints.maxWidth * 0.4
                                                : constraints.maxWidth * 0.7,
                                        child: AutoSizeText(
                                          "Tamil HipHop",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                          minFontSize: 10,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Jump back in",
                            style: GoogleFonts.cabin(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        height: 200.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _card(0),
                            SizedBox(
                              width: 15.0,
                            ),
                            _card(1),
                            SizedBox(width: 15.0),
                            _card(2),
                            SizedBox(width: 15.0),
                            _card(3),
                            SizedBox(width: 15.0),
                            _card(4),
                            SizedBox(width: 15.0),
                            _card(5),
                            SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/ilaya.jpg'),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "FOR FANS OF",
                                    style: GoogleFonts.cabin(fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Text(
                                    "Anirudh Ravichander",
                                    style: GoogleFonts.cabin(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        height: 200.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _card(0),
                            SizedBox(
                              width: 15.0,
                            ),
                            _card(1),
                            SizedBox(width: 15.0),
                            _card(2),
                            SizedBox(width: 15.0),
                            _card(3),
                            SizedBox(width: 15.0),
                            _card(4),
                            SizedBox(width: 15.0),
                            _card(5),
                            SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "New episodes",
                          style: GoogleFonts.cabin(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Card(
                          color: Color(0xFF212121),
                          elevation: 10,
                          child: Container(
                            height: 180.0,
                            width: 160,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  height: 180.0,
                                  width: 160.0,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120.0,
                                        width: 160.0,
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Browse Podcasts",
                                              style: GoogleFonts.cabin(
                                                  fontSize: 24),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Center(
                                          child: Text(
                                            "Find new shows you'll love.",
                                            style:
                                                GoogleFonts.cabin(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Namma Ooru Heroes",
                          style: GoogleFonts.cabin(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        height: 200.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _card(0),
                            SizedBox(
                              width: 15.0,
                            ),
                            _card(1),
                            SizedBox(width: 15.0),
                            _card(2),
                            SizedBox(width: 15.0),
                            _card(3),
                            SizedBox(width: 15.0),
                            _card(4),
                            SizedBox(width: 15.0),
                            _card(5),
                            SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kollywood Corner",
                          style: GoogleFonts.cabin(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        height: 200.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _card(0),
                            SizedBox(
                              width: 15.0,
                            ),
                            _card(1),
                            SizedBox(width: 15.0),
                            _card(2),
                            SizedBox(width: 15.0),
                            _card(3),
                            SizedBox(width: 15.0),
                            _card(4),
                            SizedBox(width: 15.0),
                            _card(5),
                            SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.078, 0.6],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF424242), Colors.black])),
                ),
              ],
            ),
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, SlideUpRoute(page: Musicplayer()));
                },
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFF282828)),
                  height: 60.0,
                  child: Row(
                    children: [
                      Container(
                        height: 60.0,
                        width: 80.0,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 60.0, maxWidth: 80.0),
                          child: Image.asset('assets/images/sid.jpg',
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        width: width - (329 - 150),
                        height: 60.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: MarqueeWidget(
                                text: "Sword of Destiny . Anirudh Ravichander",
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text("Devices Available"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: LikeButton(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  onTap: null,
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    color: Colors.white,
                                    iconSize: 35,
                                    icon: Icon(Icons.play_arrow),
                                    onPressed: () {
                                      Navigator.push(context,
                                          SlideUpRoute(page: Musicplayer()));
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _card(index) {
    return Container(
      height: 180.0,
      width: 160,
      child: Column(
        children: [
          Container(
            height: 140.0,
            width: 160.0,
            color: Colors.blue,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 140.0,
                maxWidth: 160.0,
              ),
              child: Image.asset(
                images[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 35.0,
            width: 160,
            child: AutoSizeText(
              artist[0],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
