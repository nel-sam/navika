import 'package:flutter/material.dart';
import 'package:navika/navika-theme.dart';

class NavSpinner extends StatelessWidget {
  const NavSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [CircularProgressIndicator(color: navPalette)],
    );
  }
}
