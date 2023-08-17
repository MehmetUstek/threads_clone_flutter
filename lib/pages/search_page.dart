import 'package:flutter/cupertino.dart';
import 'package:threads_clone/utils/profile_data.dart';

import '../components/cards/profile_card.dart';
import '../styles/text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CupertinoSearchTextField(
                controller: textController,
                placeholder: 'Search',
                enabled: true,
                onTap: () => {},

                ///TODO: Transition
                backgroundColor: CupertinoColors.tertiarySystemFill,
              )),
          Flexible(
            child: ListView.builder(
                itemCount: profileData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileCard(
                    followerCountVisible: true,
                    profileDTO: profileData.values.elementAt(index),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
