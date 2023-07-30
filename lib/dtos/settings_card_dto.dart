import 'package:flutter/material.dart';

import 'extended_card_dto.dart';
import 'options_card_dto.dart';

class SettingsCardDTO implements OptionsCardDTO {
  final IconData? iconName;
  @override
  final String cardTitle;
  final Widget? trailingIcon;
  final Function? onClick;
  final ExtendedCard? extendedCard;
  final bool? titleBold;

  SettingsCardDTO(
      {this.iconName,
      required this.cardTitle,
      this.titleBold,
      this.trailingIcon,
      this.onClick,
      this.extendedCard});
}
