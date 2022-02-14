import 'package:flutter/material.dart';

class TinyVideoPage extends StatefulWidget {
  const TinyVideoPage({Key? key}) : super(key: key);

  @override
  _TinyVideoPageState createState() => _TinyVideoPageState();
}

class _TinyVideoPageState extends State<TinyVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TinyVideopage'),
      ),
    );
  }
}
