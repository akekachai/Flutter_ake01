import 'dart:convert';

import 'package:flutter_app02/model/member.dart';
import 'package:flutter_app02/widgets/textfile.dart';
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

void checklogin(String username, String password, context) async {
  final response = await http.get(Uri.parse(
      'https://script.google.com/macros/s/AKfycbzvp5TIZmHJrn1oggzz5ih-S8VgwHuHh2d0iWmHtncnfaPKKGQg79U9_uqFG6z7GS96hQ/exec?path=/apiv&query={"names":"' +
          username +
          '"}'));

  print('tra 1');
  if (response.statusCode == 200) {
    //  print(response.body);
    // Transaction.fromJson(jsonDecode(response.body));
    var tagObjsJson = jsonDecode(response.body)['items'] as List;
    //int _rows = tagObjsJson.length;
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
  TextEditingController passwordController = TextEditingController();
  late String messages;
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo2.jpg',
                  height: 300,
                  width: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Log on to System'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFieldWidget(
                    // textAlign: TextAlign.center,
                    // controller: usernameController,
                    // keyboardType: TextInputType.name,

                    // decoration: InputDecoration(
                    //   labelText: 'Username',
                    //   icon: Icon(Icons.person),

                    // ),
                    hintText: 'username',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    textEditingController: usernameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFieldWidget(
                    hintText: 'password',
                    obscureText: true,
                    prefixIconData: Icons.vpn_key_outlined,
                    textEditingController: passwordController,
                    //textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //   fontSize: 10.0,
                    // ),
                    // decoration: InputDecoration(
                    //   labelText: 'Password',
                    //   icon: Icon(Icons.vpn_key_outlined),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          var user_Txt = usernameController.text;
                          var password_Txt = passwordController.text;
                          if (user_Txt == "") {
                            print('blank');
                            //showAlertDialog(context);
                            //dialogBuilder(context);
                            _showDialog(
                                context, "แจ้งเตือน", "โปรดใส่ username");
                          } else if (password_Txt == "") {
                            _showDialog(
                                context, "แจ้งเตือน", "โปรดใส่ password");
                          } else {
                            checklogin(user_Txt, password_Txt, context);
                          }
                        },
                        child: Text('login'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          textStyle: MaterialStateProperty.all(
                            TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Register'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'test',
                        style: TextStyle(color: Color(0xFF6F35A5)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      OrDivider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      color: Color(0XFFD9D9D9),
      height: 2,
    ),
  );
}

_showDialog(BuildContext context, String topic, String msg) {
  CupertinoAlertDialog alert = CupertinoAlertDialog(
    title: Text(topic),
    content: Text(msg),
    actions: [
      CupertinoDialogAction(
        child: Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  return showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

dialogBuilder(BuildContext context) {
  return CupertinoDialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return const CupertinoAlertDialog(
        title: Text('Title'),
        content: Text('Content'),
        actions: <Widget>[
          CupertinoDialogAction(child: Text('Yes')),
          CupertinoDialogAction(child: Text('No')),
        ],
      );
    },
  );
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
