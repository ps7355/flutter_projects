import 'package:flutter/material.dart';
import 'package:seitu/Pages/groups.dart';
import 'package:seitu/Pages/home.dart';
import 'package:seitu/Pages/sum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedindex = 0;

  void _navigatebar(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> pages = [Home(), Groups(), Sum()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[selectedindex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              onTap: _navigatebar,
              currentIndex: selectedindex,
              backgroundColor: Colors.deepPurple,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.groups_rounded), label: 'Groups'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.summarize_rounded), label: 'Sum')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
