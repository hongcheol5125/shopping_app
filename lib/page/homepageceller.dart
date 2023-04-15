import 'package:flutter/material.dart';
import 'package:shopping_app/cloth(celler)/pants.dart';
import 'package:shopping_app/cloth(celler)/shoes.dart';
import 'package:shopping_app/cloth(celler)/top.dart';

class HomePageCeller extends StatelessWidget {
  const HomePageCeller({super.key});

  goToTopPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TopPage()));
  }

  goTopantsPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PantsPage()));
  }

  goToShoesPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ShoesPage()));
  }

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
                onPressed: () {},
                child: Image.asset('asset/img/shoppingcart.png')),
            SizedBox(
              height: 20,
            ),
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
                            ElevatedButton(
                                onPressed: () {
                                  goToTopPage(context);
                                },
                                child: Text('상의')),
                            ElevatedButton(
                                onPressed: () {
                                  goTopantsPage(context);
                                },
                                child: Text('하의')),
                            ElevatedButton(
                                onPressed: () {
                                  goToShoesPage(context);
                                },
                                child: Text('신발')),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            BottomAppBar(
              child: Row(
                children: [TextButton(onPressed: () {}, child: Text('data'))],
              ),
            )
          ],
        ),
      ),
    );
  }
}
