import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';

class ExerciseButton extends StatelessWidget {
  final Widget destination;
  final IconData icon;
  final String label;
  final String sbcLabel;
  final String imagePath;
  final bool halfWidth;

  ExerciseButton({
    Key? key,
    required this.destination,
    required this.label,
    required this.imagePath,
    required this.icon,
    this.halfWidth = false,
    this.sbcLabel = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = N.getScreenWidth();
    double buttonWidth =
        this.halfWidth ? (screenWidth / 2) - 20 : screenWidth - 30;
    double buttonHeight = halfWidth ? 130 : 130;
    var appBarColor = N.isDarkTheme(context)
        ? Color.fromARGB(255, 58, 58, 58)
        : N.getAppBarColor(context);
    double radius = 10;

    Widget getLabel() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(
                sbcLabel == '' ? label : sbcLabel,
                style: TextStyle(
                  fontSize: 22,
                  color: N.isDarkTheme(context) ? Colors.white : ACCENT_COLOR,
                ),
              ),
            ],
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: FONT_SIZE,
              fontStyle: FontStyle.italic,
              color: ACCENT_COLOR,
            ),
          ),
        ],
      );
    }

    Icon getIcon() {
      return Icon(
        icon,
        size: 30,
        color: N.isDarkTheme(context) ? Colors.white : ACCENT_COLOR,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(FONT_SIZE),
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: appBarColor,
            onSurface: appBarColor,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: halfWidth
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: getIcon(),
                      width: buttonWidth,
                      height: buttonHeight / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(radius),
                          topLeft: Radius.circular(radius),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: FONT_SIZE, left: FONT_SIZE),
                      child: getLabel(),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: FONT_SIZE),
                            child: getLabel())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: buttonHeight,
                          height: buttonHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(radius),
                              bottomRight: Radius.circular(radius),
                            ),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: getIcon(),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
