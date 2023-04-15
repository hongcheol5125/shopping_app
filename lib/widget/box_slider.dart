import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_app/model/clothdummy.dart';
import 'package:shopping_app/page/detail_page.dart';

class BoxSlider extends StatelessWidget {
  final List<Cloth> clothes;
  const BoxSlider({required this.clothes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('상의'),
          SizedBox(
            height: 120,
            child: ListView(
              children: makeBoxImages(context, clothes),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeBoxImages(BuildContext context, List<Cloth> clothes){
  List<Widget> results = [];
  for(var i = 0; i < clothes.length; i++) {
    results.add(
      InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailPage(cloth: clothes[i]);
              }
            )
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('asset/img/' + clothes[i].image),
        ),
      )
    );
  }
  return results;
}
}

