import 'package:audioplayers/audioplayers.dart';
import 'package:duu_chin/models/song_modal.dart';
import 'package:duu_chin/config/app_colors.dart';
import 'package:flutter/material.dart';
AudioCache audioCache = AudioCache();
AudioPlayer advancedPlayer = AudioPlayer();

class SongCard extends StatelessWidget {

  final SongItem songItem;

  const SongCard({Key? key, required this.songItem, }) : super(key: key);


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
                image: songItem.coverPictureUrl,
                fit: BoxFit.cover,
            ),
          ),
          Center(
            child: InkWell(
              child: Image.asset(
                'assets/images/icons/tiny_video.png',
                width: 22,
                height: 22,
                color: Colors.white,
              ),
              onTap: () async {
                await advancedPlayer.play(
                  songItem.songUrl,
                  isLocal: false,
                );
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
              songItem.cnName,
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
                songItem.enName,
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
                      child: Row(
                        children: [
                          Text(songItem.readCount.toString()),
                          SizedBox(width: 10,),
                          Text(songItem.thumbUpCount.toString()),
                          SizedBox(width: 10,),
                          Text(songItem.commentCount.toString()),
                        ],
                      )
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