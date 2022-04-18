import 'package:flutter/material.dart';


class GallerryBasePart extends StatelessWidget {

  const GallerryBasePart({Key? key}) : super(key: key);

  static const List<Widget> _basePart = [
    Text('App Bar'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gallery base part', style: TextStyle(color: Colors.black26)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black26,
          ),
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _basePart.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                child: _basePart[index],
              ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 2
              )
            ),
          );
        }
      ),
    );
  }
}