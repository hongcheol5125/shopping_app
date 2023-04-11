import 'package:flutter/material.dart';
import 'package:shopping_app/page/homepage.dart';
import 'package:shopping_app/page/log_in_page.dart';

class SplashPage extends StatefulWidget {
  final int duration;
  final Widget goToPage;

  const SplashPage({required this.duration, required this.goToPage, super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: this.widget.duration), (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LogInPage()),
      );
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asset/img/shoppingcart.png'),
          CircularProgressIndicator(),
        ],
      )
    );
  }
}