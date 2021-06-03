import 'package:flutter/material.dart';

const CORRECT_COLOR = Colors.green;
const WRONG_COLOR = Colors.deepOrange;
const ICON_COLOR = Colors.blue;
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
const SINGULAR_ICON =
    Icons.looks_one_outlined; // Icons.crop_square_outlined; //Text('1');
// Icon(Icons.perm_identity, color: ICON_COLOR); //Text('1');
// Icon(Icons.looks_one_outlined, color: ICON_COLOR); //Text('1');

const PLURAL_ICON = Icons.widgets_outlined; //Text('2+');
//Icon(Icons.looks_two_outlined, color: ICON_COLOR); //Text('2+');
// Icon(Icons.group_add_outlined, color: ICON_COLOR); //Text('2+');
//scatter_plot_outlined
//view_comfortable_rounded

const MASCULINE_ICON = Icons.male;
const FEMINIE_ICON = Icons.female;
const NEUTER_ICON = Icons.hide_source_outlined;
