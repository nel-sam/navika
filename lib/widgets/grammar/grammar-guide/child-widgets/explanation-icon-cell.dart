import 'package:flutter/material.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final Widget icon;
  final String label;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCellWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 5,
          ),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: FONT_SIZE - 2, color: Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
