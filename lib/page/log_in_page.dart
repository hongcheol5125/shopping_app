import 'package:flutter/material.dart';
import 'package:shopping_app/page/register_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  goToRegisterPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGO'),
      ),
      body: Column(
        children: [
          Image.asset('asset/img/japan6.jpg'),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('ID : '),
                    Expanded(
                      child: TextField(
                        controller: idController,
                        decoration: InputDecoration(
                            hintText: 'Write down your ID',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('PASSWORD : '),
                    Expanded(
                      child: TextField(
                        controller: pwController,
                        decoration: InputDecoration(
                            hintText: 'Write down your PASSWORD',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('로그인'),
          ),
          TextButton(
              onPressed: () {
                goToRegisterPage();
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
