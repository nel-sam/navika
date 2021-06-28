import 'package:flutter/material.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class DeclensionTableCell extends StatelessWidget {
  final List<TextSpan> children;
  final Color? backgroundColor;

  const DeclensionTableCell({
    Key? key,
    required this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: backgroundColor,
      child: Center(
        child: NText(
          children,
        ),
      ),
    );
  }
}
