import 'package:audioplayers/audioplayers.dart';
import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/config/app_colors.dart';
import 'package:flutter/material.dart';

import 'comment_part.dart';
AudioCache audioCache = AudioCache();
AudioPlayer advancedPlayer = AudioPlayer();

class SongCard extends StatefulWidget {
  final SongItem songItem;
  const SongCard({Key? key, required this.songItem, }) : super(key: key);

  @override
  _SongPageCard createState() => _SongPageCard();
}

class _SongPageCard extends State<SongCard> {

  var playedUrl = '';
  var status = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _songCover(),
          SizedBox(width: 8,),
          _songContent(),
        ],
      ),
    );
  }

  // 封面
  Widget _songCover() {
    return Container(
      width: 75,
      height: 75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/common/lazy-1.png',
                image: widget.songItem.coverPictureUrl,
                fit: BoxFit.cover,
            ),
          ),
          Center(
            child: InkWell(
              child: Image.asset(
                this.status == 'pause' ? 'assets/images/icons/tiny_video.png' : 'assets/images/icons/play_plus.png',
                width: 22,
                height: 22,
                color: Colors.white,
              ),
              onTap: () async {
                if(this.playedUrl != widget.songItem.songUrl) {
                  setState(() {
                    playedUrl = widget.songItem.songUrl;
                  });
                  await advancedPlayer.play(
                    widget.songItem.songUrl,
                    isLocal: false,
                  );
                } else {
                  if(this.status == 'pause') {
                    await advancedPlayer.resume();
                    setState(() {
                      status = '';
                    });
                  } else {
                    advancedPlayer.pause();
                    setState(() {
                      status = 'pause';
                    });
                  }
                }

                advancedPlayer.onPlayerCompletion.listen((event) {
                  setState(() {
                    playedUrl = '';
                    status = '';
                  });
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // 歌曲卡片主体
  Widget _songContent() {
    return Expanded(
      child: SizedBox(
        height: 75,
        child: Stack(
          children: [
            Text(
              widget.songItem.cnName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.active,
              ),
            ),
            Positioned(
              top: 25,
              child: Text(
                widget.songItem.enName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.un3active,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: CommentPart(songItem: widget.songItem,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}