import 'package:flutter/material.dart';
import 'package:shuttle/Search.dart';
import 'package:shuttle/firstscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 1;
  final screenIndex = [firstscreen(),search()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFF1C1C1C),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/wall.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: screenIndex[_currentIndex]),
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Curves.fastLinearToSlowEaseIn,
            backgroundColor: Colors.transparent,
            color: Color(0xff2b2b2b),
            buttonBackgroundColor: Color(0xff2b2b2b),
            items: [
              Tooltip(
                  message: "Categories",
                  child: Icon(Icons.category_rounded,size: 25,color: Colors.white)),
              Tooltip(
                  message: "Wallpapers",
                  child: Icon(Icons.search,size: 25,color: Colors.white)),
            ],
            height: 50,
            index: 1,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }
}
