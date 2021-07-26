import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app02/global.dart';
import 'package:flutter_app02/widgets/bottomNavbar.dart';
import 'package:flutter_app02/widgets/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetaliScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Global.kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Mediatation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3-10 MIN Course",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .6,
                  child: Text(
                      "Live happier and healthier by learning the fundamenttals of meditation and xxxxxxxxx"),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .5,
                  child: SearchBar(),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    SessionCard(
                      sessionNum: 1,
                      isDone: true,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 2,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 3,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 4,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 5,
                      isDone: false,
                      press: () {},
                    ),
                    SessionCard(
                      sessionNum: 6,
                      isDone: false,
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Meditation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 23,
                        color: Global.kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                          "assets/icons/Meditation_women_small.svg"),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Basic 2",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text("Start your deepen you partice"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/Lock.svg"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function() press;
  const SessionCard({
    Key? key,
    required this.sessionNum,
    required this.isDone,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: constraint.maxWidth / 2 -
            10, // constraint.maxWidth provide us the available with for
        //padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 10,
              spreadRadius: -13,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 42,
                    width: 43,
                    decoration: BoxDecoration(
                      color: isDone ? Global.kBlueColor : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Global.kBlueColor),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : Global.kBlueColor,
                    ),
                  ),
                  Text(
                    " Session $sessionNum",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
