import 'package:flutter/material.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/explanation_icon_cell.dart';
import 'package:nrs_flutter_lib/constants.dart';

class CountIcon extends StatelessWidget {
  const CountIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: FONT_SIZE - 6, // TODO: Verify this shows up correctly
    );
  }
}

class PluralTableCell extends StatelessWidget {
  const PluralTableCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExplanationIconCell(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountIcon(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountIcon(),
              CountIcon(),
            ],
          )
        ],
      ),
      label: N.t('plural'),
    );
  }
}

class SingularTableCell extends StatelessWidget {
  const SingularTableCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExplanationIconCell(
      icon: CountIcon(),
      label: N.t('singular'),
    );
  }
}
