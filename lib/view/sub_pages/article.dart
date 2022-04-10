import 'package:duu_chin/components/comment_part.dart';
import 'package:duu_chin/components/user_info_part.dart';
import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/request/http_utils.dart';
import 'package:flutter/material.dart';


class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _articles createState() => _articles();
}

class _articles extends State<Articles> {

  List<SongItem> _songList = SongList([]).list;

  @override
  void initState() {
    super.initState();

    getVideosData();
  }

  void getVideosData() async {
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
    return ListView.builder(
      itemCount: _songList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Text('12345'),
            Image.asset(
              'assets/images/common/lazy-3.png',
              height: 100,
              width: 100,
            ),
            Row(
                children: [
                  UserInfoPart(songItem: _songList[index]),
                  CommentPart(songItem: _songList[index]),
                ]
            )
          ],
        );
      },
    );
  }
}