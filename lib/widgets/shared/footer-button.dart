import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

// ignore: non_constant_identifier_names
Widget FooterButton({
  required BuildContext context,
  required String text,
  required Function onPressed,
  required IconData icon,
  bool disabled = false,
}) =>
    Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
        child: MaterialButton(
          child: Column(
            children: [
              Icon(icon, color: disabled ? Colors.grey : ACCENT_COLOR),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: disabled ? Colors.grey : ACCENT_COLOR),
              ),
            ],
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
