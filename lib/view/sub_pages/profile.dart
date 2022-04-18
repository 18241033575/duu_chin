import 'package:duu_chin/components/example_function.dart';
import 'package:duu_chin/components/profile_info_card.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileInfoCard(),
          Expanded(
            child: ExampleFunction(),
          )
        ],
      ),
    );
  }
}