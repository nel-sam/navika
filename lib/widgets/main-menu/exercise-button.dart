import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';

class ExerciseButton extends StatelessWidget {
  final Widget destination;
  final IconData icon;
  final String label;
  final String imagePath;
  final bool halfWidth;

  const ExerciseButton({
    Key? key,
    required this.destination,
    required this.label,
    required this.imagePath,
    required this.icon,
    this.halfWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = N.getScreenWidth(context);
    double buttonWidth =
        this.halfWidth ? (screenWidth / 2) - 20 : screenWidth - 30;
    double buttonHeight = halfWidth ? 110 : 130;
    var appBarColor = N.isDarkTheme(context)
        ? Color.fromARGB(255, 58, 58, 58)
        : N.getAppBarColor(context);
    double radius = 10;

    return Padding(
      padding: const EdgeInsets.all(FONT_SIZE / 2),
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
                  children: [
                    Container(
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
                    getIcon(),
                    getLabel(),
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

  Padding getLabel() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: halfWidth ? 17 : 24,
          color: ACCENT_COLOR,
        ),
      ),
    );
  }

  Padding getIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: FONT_SIZE),
      child: Icon(
        icon,
        size: halfWidth ? 50 : 25,
        color: ACCENT_COLOR,
      ),
    );
  }
}
