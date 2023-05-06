import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_action_arrow.dart';

class SettingsMenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget Function(BuildContext) redirectMethod;

  SettingsMenuButton({
    Key? key,
    required this.redirectMethod,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent, // TODO: Verify color
        side: BorderSide(color: BORDER_COLOR.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: FONT_SIZE, bottom: FONT_SIZE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: FONT_SIZE / 2),
                  child: Icon(icon),
                ),
                Text(title)
              ],
            ),
            NActionArrow()
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: redirectMethod),
        );
      },
    );
  }
}
