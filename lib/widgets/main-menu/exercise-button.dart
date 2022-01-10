import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    var buttonWidth =
        this.halfWidth ? (screenWidth / 2) - 20 : screenWidth - 30;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: halfWidth ? 110 : 130,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(CELL_TEXT_PADDING),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(icon, size: halfWidth ? 20 : 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: buttonWidth - 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: ACCENT_COLOR),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                            fontSize: halfWidth ? 17 : 24, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
