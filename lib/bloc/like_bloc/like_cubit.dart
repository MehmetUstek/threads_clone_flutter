import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<int> {
  LikeCubit(int initialOption) : super(initialOption);

  void onLike() {
    emit(state + 1);
  }

  void onUnlike() {
    emit(state - 1);
  }
}
