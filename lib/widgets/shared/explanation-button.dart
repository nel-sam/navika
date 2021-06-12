import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';

import '../../constants.dart';

class ExplanationButton extends StatelessWidget {
  final String textTitle;
  final Widget popupWidget;

  const ExplanationButton({
    Key? key,
    required this.popupWidget,
    this.textTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary:
                N.isDarkTheme(context) ? Colors.white : ICON_COLOR),
        child: this.textTitle != ''
            ? Text(textTitle, style: TextStyle(color: ICON_COLOR))
            : Icon(Icons.help_center_outlined),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => popupWidget,
          );
        },
      ),
    );
  }
}
