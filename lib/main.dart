import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/pages/activity_page.dart';
import 'package:threads_clone/pages/home_page.dart';
import 'package:threads_clone/pages/profile_page.dart';
import 'package:threads_clone/pages/search_page.dart';
import 'package:threads_clone/pages/splash_screen.dart';

import 'components/bottomSheets/new_thread_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
    const ActivityPage(),
    const ProfilePage(
      fullName: "Mehmet Üstek",
      username: "mehmetustekk",
      userBio: "Koc University",
      followerCount: 123,
      profilePhotoPath:
          "https://avatars.githubusercontent.com/u/53303474?s=400&u=1dc04b3eb1ac41e765f0f2dd1f9ce717b10122f0&v=4",
    ),
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      newThreadBottomSheet(context: context, isReply: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.penToSquare),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Post',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: SafeArea(child: _widgetOptions[_selectedIndex]),
      //TODO: Implement a navigator to keep bottom navigation when new page is pushed.
    );
  }
}
