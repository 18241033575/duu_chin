import 'package:duu_chin/components/singer_comment_part.dart';
import 'package:duu_chin/models/user_modal.dart';
import 'package:duu_chin/request/http_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingerPage extends StatefulWidget {
  SingerPage({Key? key}) : super(key: key);
  @override
  _SingerPage createState() => _SingerPage();
}

class _SingerPage extends State<SingerPage> {
  List<UserItem> _userList = UserList([]).list;

  @override
  void initState() {
    super.initState();
    getSingerData();
  }

  void getSingerData() async {
    try {
      Map<String, dynamic> response = await HttpUtils.get('http://localhost:3080/user');
      print(response['data']);
      UserList songListModal = UserList.fromJson(response['data']);
      // print('123$songListModal');
      setState(() {
        _userList = songListModal.list;
      });
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴三个子widget
          childAspectRatio: 0.6 //宽高比为1时，子widget
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

  List<Widget> listBox() => List.generate(_userList.length, (index) {
    return Container(
      height: 100,
      color: Colors.amber,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            image: 'assets/images/common/lazy-3.png',
            placeholder: 'assets/images/common/lazy-3.png',
            fit: BoxFit.cover,
            height: 80,
          ),
          SingerCommentPart(userItem: _userList[index],),
        ],
      )
    );
  });
}