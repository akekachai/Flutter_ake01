import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app02/global.dart';
import 'package:flutter_app02/widgets/bottomNavbar.dart';

import 'package:flutter_app02/widgets/category_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomNavItem(
                title: "Today",
                svgScr: "assets/icons/calendar.svg",
                press: () {},
                isActive: false,
              ),
              BottomNavItem(
                title: "All Exercise",
                svgScr: "assets/icons/gym.svg",
                press: () {},
                isActive: true,
              ),
              BottomNavItem(
                title: "Setting",
                svgScr: "assets/icons/Settings.svg",
                press: () {},
                isActive: false,
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Color(0xFFF5CE8),
                image: DecorationImage(
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text(
                      'Badminton \nTeam',
                      //style: Theme.of(context).textTheme.headline3 ,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "ค้นหา",
                            icon: SvgPicture.asset("assets/icons/search.svg"),
                            border: InputBorder.none),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.all(20),
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            svgSrc: "assets/icons/Hamburger.svg",
                            title: "Diet Recommendation",
                            press: () {},
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/Excrecises.svg",
                            title: "Exercises",
                            press: () {},
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/Meditation.svg",
                            title: "Meditation",
                            press: () {},
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/yoga.svg",
                            title: "yoga",
                            press: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
