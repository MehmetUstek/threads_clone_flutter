import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/bloc/mentions_bloc/mentions_cubit.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';
import 'package:threads_clone/dtos/mentions_enum.dart';

import '../components/settings_card.dart';
import '../utils/utils.dart';

class BlocOptionsPage extends StatelessWidget {
  const BlocOptionsPage(
      {Key? key, required this.optionsData, required this.pageName})
      : super(key: key);
  final Function optionsData;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      pageName: pageName,
      backbuttonEnum: BackButtonEnum.back,
      body: BlocProvider(
        create: (BuildContext context) => MentionsCubit(MentionsEnum.everyone),
        child: BlocBuilder<MentionsCubit, MentionsEnum>(
            builder: (blocContext, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: screenHeight(context),
                  child: ListView.builder(
                    itemCount: optionsData(blocContext, state).length,
                    itemBuilder: (BuildContext itemContext, int index) {
                      return SettingsCard(
                        settingsOptions: optionsData(blocContext, state)[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
