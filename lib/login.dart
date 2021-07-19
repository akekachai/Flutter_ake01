import 'dart:convert';
import 'dart:js';
import 'package:flutter_app02/model/member.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app02/Home.dart';

//import 'package:flutter_app02/model/member.dart';
//import 'global.dart' as global;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

void checklogin(String username, context) async {
  final response = await http.get(Uri.parse(
      'https://script.google.com/macros/s/AKfycbzvp5TIZmHJrn1oggzz5ih-S8VgwHuHh2d0iWmHtncnfaPKKGQg79U9_uqFG6z7GS96hQ/exec?path=/apiv&query={"names":"' +
          username +
          '"}'));

  print('tra 1');
  if (response.statusCode == 200) {
    //  print(response.body);
    // Transaction.fromJson(jsonDecode(response.body));
    var tagObjsJson = jsonDecode(response.body)['items'] as List;
    int _rows = tagObjsJson.length;
    for (var i in tagObjsJson) {
      print(i['names']);
    }
    print(tagObjsJson[0]['names']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }
}

class _LoginState extends State<Login> {
  late Future<Transaction> futureMember;
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    //fetchPost();
    super.initState();
    // futureAlbum = fetchAlbum();
    // futureMember = fetchMember();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/Logo2.jpg'),
            Text('Log on to System'),
            TextField(
              textAlign: TextAlign.center,
              controller: usernameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Username',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.vpn_key_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      checklogin(usernameController.text, context);

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Text('login'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 10))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Register'),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
