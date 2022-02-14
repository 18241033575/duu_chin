import 'package:flutter/material.dart';

import 'package:duu_chin/config/app_colors.dart';
import 'package:duu_chin/components/root_page_head.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(text: '微读'),
  Tab(text: '推荐'),
  Tab(text: '歌曲'),
  Tab(text: '歌手'),
  Tab(text: '小视频'),
  Tab(text: '文章'),
  Tab(text: '视频'),
  Tab(text: '视频'),
  Tab(text: '视频'),
  Tab(text: '视频'),
];

final List<Widget> _tabsContent = [
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
  Text('weidu1'),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    // Http.get();

    _tabController = TabController(
      initialIndex: 1,
      length: _tabs.length,
      vsync: this,
    );
    //
    // _tabController.addListener(() {
    //   _tabController.index
    // });
  }
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
         children: _tabsContent,
         controller: _tabController,
      ),
    );
  }
}
