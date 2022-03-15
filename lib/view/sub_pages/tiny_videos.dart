import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TinyVideos extends StatefulWidget {
  TinyVideos({Key? key}) : super(key: key);
  @override
  _TinyVideos createState() => _TinyVideos();
}

class _TinyVideos extends State<TinyVideos> {

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴三个子widget
          childAspectRatio: 0.6 //宽高比为1时，子widget
      ),
      children: ListBox(),
    );
    // return ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Column(

    //     );
    //   },
    // );
  }

  List<Widget> ListBox() => List.generate(20, (index) {
    return Container(
      height: 100,
      color: Colors.amber,
      margin: EdgeInsets.all(10),
      child:  FadeInImage.assetNetwork(
        image: 'assets/images/common/lazy-3.png',
        placeholder: 'assets/images/common/lazy-3.png',
        fit: BoxFit.cover,
      ),
    );
  });
}