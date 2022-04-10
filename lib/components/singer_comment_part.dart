import 'package:duu_chin/models/user_modal.dart';
import 'package:flutter/material.dart';


class SingerCommentPart extends StatelessWidget {
  final UserItem userItem;
  const SingerCommentPart({Key? key, required this.userItem,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Row(
              children: [
                Image.asset('assets/images/icons/read.png', width: 24, height: 24,),
                SizedBox(width: 4,),
                Text(userItem.musicCount.toString()),
              ],
            ),
            SizedBox(width: 10,),
            Row(
              children: [
                Image.asset('assets/images/icons/read.png', width: 24, height: 24,),
                SizedBox(width: 4,),
                Text(userItem.musicPlayCount.toString()),
              ],
            ),
          ],
        )
    );
  }

}