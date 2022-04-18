import 'package:flutter/material.dart';

class ProfileInfoCard extends StatefulWidget {
  const ProfileInfoCard({Key? key}) : super(key: key);

  @override
  _ProfileInfoCard createState() => _ProfileInfoCard();
}

class _ProfileInfoCard extends State<ProfileInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,

      child: Center(
        child: new CircleAvatar(
          backgroundImage: AssetImage(
              'assets/images/common/logo.png'
          ),
          radius: 36,
        ),
      ),
    );
  }
}