import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/dtos/mentions_enum.dart';

class MentionsCubit extends Cubit<MentionsEnum> {
  MentionsCubit(MentionsEnum initialOption) : super(initialOption);

  void changeMentionOption(MentionsEnum newOption) {
    emit(newOption);
  }
}
