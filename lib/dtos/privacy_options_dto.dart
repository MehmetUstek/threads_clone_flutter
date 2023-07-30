import 'package:flutter/material.dart';

import 'extended_card_dto.dart';
import 'options_card_dto.dart';

class PrivacySubOptionsDTO implements OptionsCardDTO {
  @override
  final String cardTitle;
  final Widget? trailingIcon;
  final Function? onClick;
  final ExtendedCard? extendedCard;

  PrivacySubOptionsDTO(
      {required this.cardTitle,
      this.trailingIcon,
      this.onClick,
      this.extendedCard});
}
