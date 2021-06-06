import 'package:flutter/material.dart';
import 'package:navika/utilities/widget-helpers.dart';

import '../../constants.dart';

class ExplanationButton extends StatelessWidget {
  final Widget popupWidget;

  const ExplanationButton({
    Key? key,
    required this.popupWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary:
                WidgetHelpers.isDarkTheme(context) ? Colors.white : ICON_COLOR),
        child: Icon(Icons.help_center_outlined),
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
