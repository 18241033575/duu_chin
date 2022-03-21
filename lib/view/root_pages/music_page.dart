import 'package:duu_chin/components/root_page_head.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

const List<Tab> _musicTabs = [
    Tab(text: '推荐',),
    Tab(text: '歌曲',),
    Tab(text: '歌手',),
    Tab(text: '歌单',),
];

const List<Widget> _musicTabsContent = [
    Tab(text: '推荐Content',),
    Tab(text: '歌曲Content',),
    Tab(text: '歌手Content',),
    Tab(text: '歌单Content',),
];

class _MusicPageState extends State<MusicPage> with TickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 1,
      length: _musicTabs.length,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _musicTabs,
          controller: _tabController,
          isScrollable: false,
        ),
      ),
      body: TabBarView(
        children: _musicTabsContent,
        controller: _tabController,
      ),
    );
  }
}
