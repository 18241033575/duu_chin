import 'package:duu_chin/models/song_modal.dart';
import 'package:flutter/material.dart';


class CommentPart extends StatelessWidget {
  final SongItem songItem;
  const CommentPart({Key? key, required this.songItem,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('assets/images/icons/read.png', width: 24, height: 24,),
              SizedBox(width: 4,),
              Text(songItem.readCount.toString()),
            ],
          ),
          SizedBox(width: 10,),
          Row(
            children: [
              Image.asset('assets/images/icons/like.png', width: 24, height: 24,),
              SizedBox(width: 4,),
              Text(songItem.thumbUpCount.toString()),
            ],
          ),
          SizedBox(width: 10,),
          Row(
            children: [
              Image.asset('assets/images/icons/comment.png', width: 24, height: 24,),
              SizedBox(width: 4,),
              Text(songItem.commentCount.toString()),
            ],
          ),
        ],
      )
    );
  }

}