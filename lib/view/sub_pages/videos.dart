import 'package:flutter/material.dart';


class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  _videos createState() => _videos();
}

class _videos extends State<Videos> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              child: Text('$index'),
            )
          ],
        );
      },
    );
  }
}