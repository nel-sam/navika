import 'package:flutter/material.dart';

const CORRECT_COLOR = Colors.green;
const WRONG_COLOR = Colors.deepOrange;
const ICON_COLOR = Colors.blue;
const CARD_PADDING = 10.0;
const DECLINED_LETTER_STYLE =
    TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
const TABLE_CELL_HEIGHT = 60.0;
const CELL_TEXT_PADDING = 5.0;
const TABLE_CELL_PADDING = EdgeInsets.all(10);
const TABLE_CELL_TEXT_STYLE = TextStyle(
  fontSize: 16.0,
  //color: Colors.black,
);
const TABLE_BORDER =
    BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid);
const TABLE_BORDERS = TableBorder(
  right: TABLE_BORDER,
  top: TABLE_BORDER,
  left: TABLE_BORDER,
  bottom: TABLE_BORDER,
  horizontalInside:
      BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
  verticalInside: BorderSide(
    width: 1,
    color: Colors.grey,
    style: BorderStyle.solid,
  ),
);
const SINGULAR_ICON = Icons.looks_one_outlined;
const PLURAL_ICON = Icons.widgets_outlined;

const MASCULINE_ICON = Icons.male;
const FEMINIE_ICON = Icons.female;
const NEUTER_ICON = Icons.hide_source_outlined;

const APP_BAR_TEXTTHEME_DARK = TextTheme();
const APP_BAR_TEXTTHEME_LIGHT = TextTheme(
  headline6: TextStyle(color: Colors.black),
);
const APP_BAR_ICONTHEME_DARK = IconThemeData();
const APP_BAR_ICONTHEME_LIGHT = IconThemeData(color: ICON_COLOR);
