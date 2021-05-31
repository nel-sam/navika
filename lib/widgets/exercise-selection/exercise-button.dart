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
      padding: const EdgeInsets.all(10),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: OutlinedButton.styleFrom(minimumSize: Size(300, 80)),
        child: Column(
          children: [
            Icon(icon),
            Text(label),
          ],
        ),
      ),
    );
  }
}
