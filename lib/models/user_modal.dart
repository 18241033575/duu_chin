import 'package:flutter/cupertino.dart';


class UserItem {
    final int id;
    final String coverPictureUrl;
    final String nickname;
    final String type;
    final String musicCount;
    final String musicPlayCount;

    UserItem({
      required this.id,
      required this.coverPictureUrl,
      required this.nickname,
      required this.type,
      required this.musicCount,
      required this.musicPlayCount,
    });

    factory UserItem.fromJson(dynamic item) {
        return UserItem(
            id: item['id'],
            coverPictureUrl: item['coverPictureUrl'],
            nickname: item['nickname'],
            type: item['type'],
            musicCount: item['musicCount'],
            musicPlayCount: item['musicPlayCount']
        );
    }

}