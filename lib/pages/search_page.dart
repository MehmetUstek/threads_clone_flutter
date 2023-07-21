import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/styles/color_styles.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../components/profile_card.dart';
import '../dtos/profile_dto.dart';
import '../utils/search_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Search",
              style: header(),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: Size.fromHeight(30)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.search,
                        color: darkGrey,
                        size: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Search",
                          style: smallText(),
                        ),
                      )
                    ]),
              )),
          Expanded(
            child: ListView.builder(
                itemCount: search_data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileCard(
                    profileDTO: ProfileDTO.fromJson(search_data[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
