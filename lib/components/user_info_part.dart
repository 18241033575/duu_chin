import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/models/user_modal.dart';
import 'package:flutter/material.dart';


class UserInfoPart extends StatelessWidget {
  final SongItem songItem;
  const UserInfoPart({Key? key, required this.songItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/icons/read.png', width: 24, height: 24,),
          Text(songItem.cnName),
          Text(songItem.enName),
        ],
      ),
    );
  }

}