import 'package:flutter/material.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/declension_table.dart';

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
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
