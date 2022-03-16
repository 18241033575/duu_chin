import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingerPage extends StatefulWidget {
  SingerPage({Key? key}) : super(key: key);
  @override
  _SingerPage createState() => _SingerPage();
}

class _SingerPage extends State<SingerPage> {

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