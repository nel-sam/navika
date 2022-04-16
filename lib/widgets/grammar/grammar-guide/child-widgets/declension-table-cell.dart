import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';

class DeclensionTableCell extends StatelessWidget {
  final List<TextSpan> children;
  final bool highlightItem;
  final bool isEqualItem;
  final Color equalItemColor;

  const DeclensionTableCell({
    Key? key,
    required this.children,
    this.highlightItem = false,
    this.isEqualItem = false,
    this.equalItemColor = EQUAL_ITEMS_BORDER_COLOR,
  }) : super(key: key);

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
                border: Border.all(width: borderWidth, color: equalItemColor),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: highlightItem
                ? BoxDecoration(
                    border: Border.all(
                        width: borderWidth,
                        color: Nrs.getPrimaryColor(context)),
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Center(
                child: NTextMulti(
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
