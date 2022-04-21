import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class CountIcon extends StatelessWidget {
  const CountIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Nrs.isDarkTheme(context);

    return Icon(
      Icons.circle,
      size: FONT_SIZE - 6,
      color: isDarkTheme ? Colors.white : Colors.black.withOpacity(0.6),
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
