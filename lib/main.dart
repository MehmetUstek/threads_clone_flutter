import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/utils/entry_data.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';

import 'Entry.dart';
import 'components/entry_dto.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: Icon(CupertinoIcons.house_alt_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_pencil),
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
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.deepOrange,

            onRefresh: () async {
              // Replace this delay with the code to be executed during refresh
              // and return asynchronous code
              //TODO: Update data when refreshed.
              return Future<void>.value(
                  entry_data.map((i) => EntryDTO.fromJson(i)).toList());
            },
            // This check is used to customize listening to scroll notifications
            // from the widget's children.
            //
            // By default this is set to `notification.depth == 0`, which ensures
            // the only the scroll notifications from the first child are listened to.
            //
            // Here setting `notification.depth == 1` triggers the refresh indicator
            // when overscrolling the nested scroll view.
            // notificationPredicate: (ScrollNotification notification) {
            //   return notification.depth == 1;
            // },
            child: ListView.builder(
                itemCount: entry_data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Entry(
                    entryDTO: EntryDTO.fromJson(entry_data[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
