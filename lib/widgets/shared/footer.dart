import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/grammar-guide.dart';

// ignore: non_constant_identifier_names
List<Widget> NavikaChildFooterButtons({
  //required Widget explanationWidget, // TODO: Change this to scroll-point param
  required void Function() refreshFunction,
  required BuildContext context,
}) {
  final Color iconColor = N.isDarkTheme(context) ? Colors.white : ICON_COLOR;
  const double bottomPadding = 12.0;

  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: bottomPadding),
          child: IconButton(
            onPressed: refreshFunction,
            color: iconColor,
            icon: Icon(
              Icons.refresh_outlined,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: bottomPadding),
          child: IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            color: iconColor,
            icon: Icon(
              Icons.home,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: bottomPadding),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => GrammarGuide(),
              );
            },
            color: iconColor,
            icon: Icon(
              Icons.help_center_outlined,
            ),
          ),
        ),
      ],
    ),
  ];
}
