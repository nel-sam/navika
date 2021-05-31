import 'package:flutter/material.dart';

class Akusativ extends StatefulWidget {
  @override
  _AkusativState createState() => _AkusativState();
}

class _AkusativState extends State<Akusativ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akusativ'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [],
        ),
      ),
    );
  }
}
