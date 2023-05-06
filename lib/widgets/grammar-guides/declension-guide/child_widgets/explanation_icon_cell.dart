import 'package:flutter/material.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/declension_table.dart';
import 'package:nrs_flutter_lib/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isHeader;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
    required this.label,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCellWrapper(
      isHeader: this.isHeader,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          icon,
          SizedBox(
            height: 5,
          ),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: FONT_SIZE - 3, // TODO: Verify this shows up correctly
            ),
          ),
        ],
      ),
    );
  }
}
