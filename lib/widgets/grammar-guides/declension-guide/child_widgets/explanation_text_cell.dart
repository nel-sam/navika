import 'package:flutter/material.dart';

class ExplanationTextCell extends StatelessWidget {
  final List<TextSpan> children;

  const ExplanationTextCell({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .fontSize), // TODO: Verify this shows up correctly
          children: children,
        ),
      ),
    );
  }
}
