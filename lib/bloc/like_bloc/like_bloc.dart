import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_cubit.dart';

void onUnlike(BuildContext context) {
  context.read<LikeCubit>().onUnlike();
}

void onLike(BuildContext context) {
  context.read<LikeCubit>().onLike();
}
