import 'package:flutter/material.dart';
import 'package:navika/utilities/widget-helpers.dart';

import '../../constants.dart';

class RefreshButton extends StatelessWidget {
  final Function refreshFunction;

  const RefreshButton({
    Key? key,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary:
                WidgetHelpers.isDarkTheme(context) ? Colors.white : ICON_COLOR),
        child: Icon(Icons.refresh_outlined),
        onPressed: () {
          refreshFunction();
        },
      ),
    );
  }
}
