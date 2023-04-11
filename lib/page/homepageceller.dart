import 'package:flutter/material.dart';

class HomePageCeller extends StatelessWidget {
  const HomePageCeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'LOGO',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.purple[400],
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_bag_outlined),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {}, child: Image.asset('asset/img/shoppingcart.png')),
              SizedBox(height: 20,),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text('상의')),
                          ElevatedButton(onPressed: (){}, child: Text('하의')),
                          ElevatedButton(onPressed: (){}, child: Text('신발')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text('아우터')),
                          ElevatedButton(onPressed: (){}, child: Text('속옷')),
                          ElevatedButton(onPressed: (){}, child: Text('모자')),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('안경')),
                        ElevatedButton(onPressed: (){}, child: Text('양말')),
                        ElevatedButton(onPressed: (){}, child: Text('잡동')),
                      ],
                    ),
                    BottomAppBar()
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
