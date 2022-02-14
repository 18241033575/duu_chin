import 'dart:async';

import 'package:flutter/material.dart';
import 'package:duu_chin/root_page.dart';

class TransitPage extends StatefulWidget {
  TransitPage({Key? key}) : super(key: key);

  @override
  _Transit createState() => _Transit();
}

class _Transit extends State<TransitPage> {

  final textSize = 12.00;
  int _currentTime = 6;
  Timer? _timer;
  
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
        setState(() {
          _currentTime--;
        });

        if(_currentTime <= 0) {
            _jumpRootPage();
        }
    });
  }

  void _jumpRootPage () {
    _timer!.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => RootPage()
        ), (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/common/page.png',
            fit: BoxFit.cover,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
          Positioned(
            top: MediaQuery
                .of(context)
                .padding
                .top + 10,
            right: 10,
            child: InkWell(child: _clipButton(), onTap: _jumpRootPage),
          ),
        ],
      ),
    );
  }


  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 64,
        height: 32,
        color: Colors.black26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${_currentTime}s |',
              style: TextStyle(color: Colors.white, fontSize: textSize),
            )
            , Text(
              ' 跳过',
              style: TextStyle(color: Colors.white, fontSize: textSize,),
            ),

          ],
        ),
      ),
    );
  }
}
