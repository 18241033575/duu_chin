import 'package:flutter/cupertino.dart';

class UserList {
  final List<UserItem> list;

  UserList(this.list);

  factory UserList.fromJson(List<dynamic> list) {
    return UserList(
      list.map((item) => UserItem.fromJson(item)).toList(),
    );
  }

}

class UserItem {
    final int id;
    final String coverPictureUrl;
    final String nickname;
    final String type;
    final int musicCount;
    final int musicPlayCount;

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