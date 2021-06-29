import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class DeclensionTableCell extends StatelessWidget {
  final List<TextSpan> children;
  final bool highlightItem;
  final bool isEqualItem;

  const DeclensionTableCell({
    Key? key,
    required this.children,
    this.highlightItem = false,
    this.isEqualItem = false,
  }) : super(key: key);

  getDecoration() {
    if (highlightItem)
      return BoxDecoration(
        border: Border.all(color: ACCENT_COLOR),
        borderRadius: BorderRadius.circular(5),
      );
    else if (isEqualItem)
      return BoxDecoration(
        border: Border.all(color: EQUAL_ITEMS_BORDER_COLOR),
        borderRadius: BorderRadius.circular(5),
      );
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    const double height = 50;
    const double borderRadius = 5;
    const double borderWidth = 1;

    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        width: TABLE_CELL_WIDTH,
        height: height,
        decoration: isEqualItem
            ? BoxDecoration(
                border: Border.all(
                    width: borderWidth, color: EQUAL_ITEMS_BORDER_COLOR),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: highlightItem
                ? BoxDecoration(
                    border: Border.all(width: borderWidth, color: ACCENT_COLOR),
                    borderRadius: BorderRadius.circular(borderRadius),
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
          ),
        ),
      ),
    );
  }
}
