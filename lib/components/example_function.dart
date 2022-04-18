import 'package:duu_chin/components/example/gallery_base_part.dart';
import 'package:duu_chin/components/example/map_launch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ExampleFunction extends StatelessWidget {

  const ExampleFunction({Key? key}) : super(key: key);

  static const List<String> _functionList = [
    'share',
    'demo component',
    'map launch',
    'test',
  ];

  static const List<Widget> _functionPage = [
    Text('分享'),
    Text('gallery 组件'),
    Text('map launch'),
    Text('测试')
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _functionList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: _functionPage[index],
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black26, width: 1)
              ),
            ),
          ),
          onTap: () => {
            if(_functionList[index] == 'share') {
              shareExample()
            },
            if(_functionList[index] == 'demo component') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GallerryBasePart())
              )
            },
            if(_functionList[index] == 'map launch') {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapLauncherExample())
              )
            }
          },
        );
      },
    );
  }

  void shareExample() {
    print('share tap');
    Share.share('share test text', subject: 'Share Subject');
  }
}
