import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/model/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  Future registerAtFirestore({required User user}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .set(user.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> isIDExist({required String id}) async {
    bool isExist = false;
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      List<DocumentSnapshot> docs = value.docs.toList();
      docs.forEach((element) {
        Map<String, dynamic> docMap = element.data() as Map<String, dynamic>;
        User user = User.fromJson(docMap);
        if (user.id == id) {
          isExist = true;
        }
      });
    });
    return isExist;
  }

  showSnackBar(String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _renderInputField() {
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
          SizedBox(height: 16),
          Row(
            children: [
              Text(' confirm PASSWORD : '),
              Expanded(
                child: TextField(
                  controller: confirmController,
                  decoration: InputDecoration(
                      hintText: 'confirm your PASSWORD',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text('TYPEPASSWORD : '),
              Expanded(
                child: TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      hintText: 'Write down your TYPE PASSWORD',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Column(
        children: [
          _renderInputField(),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              if (idController.text == '' ||
                  pwController.text == '' ||
                  confirmController.text == '') {
                showSnackBar('빈 칸을 입력해주세요.');
              } else {
                bool isExist = await isIDExist(id: idController.text);
                if (isExist == true) {
                  showSnackBar('이미 존재하는 아이디입니다.');
                } else {
                  if (pwController.text != confirmController.text) {
                    showSnackBar('비밀번호가 일치하지 않습니다.');
                  } else {
                    // 기산이 코드
                    String userType = UserType.buyer;
                    if (typeController.text == '654321') {
                      userType = UserType.celler;
                    }
                    User _user = User(
                      id: idController.text,
                      password: pwController.text,
                      type: userType,
                    );
                    await registerAtFirestore(user: _user);
                    showSnackBar('$userType님 가입을 축하드립니다!');

                    // 내 코드
                    // User _user = User(
                    //     id: idController.text,
                    //     password: pwController.text,
                    //     type: '',
                    //   );
                    // if(typeController.text == '654321') {
                    //   await registerAtFirestore(user: _user);
                    //   showSnackBar('운영자님 가입을 축하드립니다!');
                    // } else{
                    //   _user.type = '구매자';
                    //   await registerAtFirestore(user: _user);
                    //   showSnackBar('회원님 가입을 축하드립니다!');
                    // }
                  }
                }
              }
            },
            child: Text('회원가입'),
          )
        ],
      ),
    );
  }
}
