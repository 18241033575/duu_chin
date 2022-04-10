import 'package:duu_chin/components/comment_part.dart';
import 'package:duu_chin/components/user_info_part.dart';
import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/request/http_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TinyVideos extends StatefulWidget {
  TinyVideos({Key? key}) : super(key: key);
  @override
  _TinyVideos createState() => _TinyVideos();
}

class _TinyVideos extends State<TinyVideos> {
  List<SongItem> _songList = SongList([]).list;

  @override
  void initState() {
    super.initState();
    getTinyVideosData();
  }
  void getTinyVideosData() async {
    try {
      Map<String, dynamic> response = await HttpUtils.get('http://localhost:3080/song/list');
      print(response['data']);
      SongList songListModal = SongList.fromJson(response['data']);
      // print('123$songListModal');
      setState(() {
        _songList = songListModal.list;
      });
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴2个子widget
          childAspectRatio: 1 //宽高比为1时，子widget
      ),
      children: listBox(),
    );
    // return ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Column(

    //     );
    //   },
    // );
  }

  List<Widget> listBox() => List.generate(_songList.length, (index) {
    return Container(
      height: 100,
      color: Colors.amber,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            image: 'assets/images/common/lazy-3.png',
            placeholder: 'assets/images/common/lazy-3.png',
            fit: BoxFit.cover,
            height: 100,
          ),
          UserInfoPart(songItem: _songList[index]),
          CommentPart(songItem: _songList[index]),
        ],
      )
    );
  });
}