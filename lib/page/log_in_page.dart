import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/page/homepagebuyer.dart';
import 'package:shopping_app/page/homepageceller.dart';
import 'package:shopping_app/page/register_page.dart';

import '../model/user.dart';

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

  goToHomePageCeller() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePageCeller()));
  }

  goToHomePageBuyer() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePageBuyer()));
  }

  showSnackBar(String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _textField() {
    return Padding(
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
    );
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: () async {
        String? _idAtFirestore;
        String? _pwAtFirestore;
        String? _typeAtFirestore;
        if (idController.text == '' || pwController.text == '') {
          showSnackBar('아이디 또는 비밀번호를 입력하세요');
        } else {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(idController.text)
              .get()
              .then((value) {
            if (value.exists) {
              Map<String, dynamic> data = value.data() as Map<String, dynamic>;
              _idAtFirestore = data['id'];
              _pwAtFirestore = data['password'];
              _typeAtFirestore = data['type'];
            }
          });
          if (idController.text != _idAtFirestore) {
            showSnackBar('아이디가 존재하지 않습니다.');
          } else {
            if (pwController.text != _pwAtFirestore) {
              showSnackBar('비밀번호가 일치하지 않습니다.');
            } else {
              String userType = UserType.celler;
              if (_typeAtFirestore == userType) {
                goToHomePageCeller();
              } else {
                goToHomePageBuyer();
              }
            }
          }
        }
      },
      child: Text('로그인'),
    );
  }

  Widget _textButton() {
    return TextButton(
      onPressed: () {
        goToRegisterPage();
      },
      child: Text(
        '회원가입',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGO'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/img/japan6.jpg'),
              _textField(),
              SizedBox(height: 16),
              _elevatedButton(),
              _textButton(),
            ],
          ),
        ),
      ),
    );
  }
}
