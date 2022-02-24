import 'package:duu_chin/components/song_card.dart';
import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/request/http_utils.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  SongPage({ Key? key }) : super(key: key);


  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  List<SongItem> _songList = SongList([]).list;
  int page = 1;
  int limit = 10;

  @override
  void initState() {
    super.initState();
    getDataList();
  }

  void getDataList() async {
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
            SizedBox(height: 7,),
            SongCard(songItem: _songList[index])
          ],
        );
      },
    );
  }
}
