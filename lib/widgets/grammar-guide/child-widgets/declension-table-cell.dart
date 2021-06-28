import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class DeclensionTableCell extends StatelessWidget {
  final List<TextSpan> children;
  final bool highlightItem;

  const DeclensionTableCell({
    Key? key,
    required this.children,
    this.highlightItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: highlightItem
          ? BoxDecoration(
              border: Border.all(color: ACCENT_COLOR),
              borderRadius: BorderRadius.circular(5),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Center(
          child: NText(
            children,
          ),
        ),
      ),
    );
  }
}
