import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

// ignore: non_constant_identifier_names
Widget SectionHeader(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
      height: 40,
      color: ACCENT_COLOR,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
