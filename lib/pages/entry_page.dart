import 'package:flutter/material.dart';
import 'package:threads_clone/components/entry_detail.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';
import 'package:threads_clone/dtos/entry_dto.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key, required this.entryDTO}) : super(key: key);
  final EntryDTO entryDTO;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      pageName: "Thread",
      backbuttonEnum: BackButtonEnum.back,
      body: EntryDetail(
        entryDTO: entryDTO,
      ),
    );
    ;
  }
}
