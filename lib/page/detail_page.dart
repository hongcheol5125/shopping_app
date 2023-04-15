import 'package:flutter/material.dart';
import 'package:shopping_app/model/clothdummy.dart';

class DetailPage extends StatefulWidget {
  final Cloth cloth;
  const DetailPage({required this.cloth, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.cloth.like;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text(widget.cloth.title),
          Image.asset('asset/img/${widget.cloth.image}'),
        ],
      ),
    );
  }
}