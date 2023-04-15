import 'package:flutter/material.dart';
import 'package:shopping_app/model/clothdummy.dart';
import 'package:shopping_app/widget/box_slider.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Cloth> clothes = [
    Cloth.fromMap({
      'title': ' polo',
      'keyword': '폴로 긴팔티',
      'image': 'polo.jpeg',
      'like': false,
    })
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOP'),
      ),
      body: Column(
        children: [
          Text('top page!'),
          BoxSlider(clothes: clothes),
        ],
      ),
    );
  }
}
