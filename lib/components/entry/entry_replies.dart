import 'package:flutter/material.dart';

import '../../dtos/entry_dto.dart';
import 'entry.dart';

class EntryReplies extends StatelessWidget {
  const EntryReplies({Key? key, required this.replies}) : super(key: key);
  final List<EntryDTO> replies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: replies.length,
        itemBuilder: (BuildContext context, int index) {
          return Entry(
            entryDTO: replies[index],
          );
        });
  }
}
