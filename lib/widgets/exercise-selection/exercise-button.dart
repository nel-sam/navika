import 'package:flutter/material.dart';

class ExerciseButton extends StatelessWidget {
  const ExerciseButton({
    Key? key,
    required this.destination,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Widget destination;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: 100,
        width: 370,
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
              Icon(icon, size: 40.0),
              Text(
                label,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
