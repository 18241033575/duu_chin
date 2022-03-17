import 'package:flutter/material.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import 'package:duu_chin/view/root_pages/home_page.dart';
import 'package:duu_chin/view/root_pages/music_page.dart';
import 'package:duu_chin/view/root_pages/profile_page.dart';
import 'package:duu_chin/view/root_pages/tiny_video_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

const Map<String, String> _bottomNames = {
  'home': '首页',
  'music': '音乐',
  'create_media': '',
  'tiny_video': '小视频',
  'profile': '我的',
};

class _RootPageState extends State<RootPage> {

  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomNavBarList = [];
  final List<IndexedStackChild> _pageList = [
    IndexedStackChild(
      child: HomePage(),
    ),
    IndexedStackChild(
      child: MusicPage(),
    ),
    IndexedStackChild(
      child: Container(),
    ),
    IndexedStackChild(
      child: TinyVideoPage(),
    ),
    IndexedStackChild(
      child: ProfilePage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _bottomNames.forEach((key, value) {
      _bottomNavBarList.add(_bottomNavigationBarItem(key, value));
    });
  }


  void _onTapClick(int index) {
    if(index == 2) {
      return _onCreateMedia();
    }
    setState(() {
      _currentIndex = index;
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProsteIndexedStack(
        index: _currentIndex,
        children: _pageList
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarList,
        currentIndex: _currentIndex,
        onTap: _onTapClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onCreateMedia() {
    print('123');
  }


  Widget _createMediaButton() {
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        child: Image.asset(
          'assets/images/icons/create_media.png',
        ),
        onPressed: _onCreateMedia,
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String key, String value) {
    return BottomNavigationBarItem(
      icon:  Image.asset(
        'assets/images/icons/$key.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/${key}_active.png',
        width: 24,
        height: 24,
      ),
      label: value,
      tooltip: '',
    );
  }
}
