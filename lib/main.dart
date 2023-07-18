import 'package:flutter/material.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';

import 'Entry.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Entry(
                  replyCount: randomNumberGenerator(),
                  username: "janedoe12",
                  isVerifiedUser: true,
                  likeCount: randomNumberGenerator(),
                  entryText: lipsum_text,
                ),
                Entry(
                  replyCount: randomNumberGenerator(),
                  username: "franzk0",
                  isVerifiedUser: true,
                  likeCount: randomNumberGenerator(),
                  entryText: short_lipsum_text,
                ),
                Entry(
                  replyCount: randomNumberGenerator(),
                  username: "ari_99",
                  likeCount: randomNumberGenerator(),
                  entryText: short_lipsum_text,
                  photoAddedPath:
                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                ),
                Entry(
                  replyCount: randomNumberGenerator(),
                  username: "ari_99",
                  likeCount: randomNumberGenerator(),
                  entryText: short_lipsum_text,
                  photoAddedPath:
                      'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
