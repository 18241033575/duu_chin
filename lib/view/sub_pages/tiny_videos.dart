import 'package:flutter/material.dart';

class TinyVideos extends StatefulWidget {
  TinyVideos({Key? key}) : super(key: key);
  @override
  _TinyVideos createState() => _TinyVideos();
}

class _TinyVideos extends State<TinyVideos> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            FadeInImage.assetNetwork(
              image: 'assets/images/common/lazy-3.png',
              placeholder: 'assets/images/common/lazy-3.png',
              fit: BoxFit.cover,
            )
          ],
        );
      },
    );
  }
}