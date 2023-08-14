import 'package:flutter/material.dart';
import 'package:threads_clone/components/entry/entry.dart';
import 'package:threads_clone/utils/entry_data.dart';

import '../dtos/entry_dto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,

        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return asynchronous code
          //TODO: Update data when refreshed.
          return Future<void>.value(
              entryData.map((i) => EntryDTO.fromJson(i)).toList());
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
            itemCount: entryData.length,
            itemBuilder: (BuildContext context, int index) {
              print(EntryDTO.fromJson(entryData[index]));
              return Entry(
                entryDTO: EntryDTO.fromJson(entryData[index]),
              );
            }),
      ),
    );
  }
}
