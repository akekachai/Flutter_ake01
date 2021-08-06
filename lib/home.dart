import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app02/screens/detail_screen.dart';
import 'package:flutter_app02/widgets/bottomNavbar.dart';

import 'package:flutter_app02/widgets/category_card.dart';
import 'package:flutter_app02/widgets/search_bar.dart';
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
        bottomNavigationBar: BottomNavBar(),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Color(0xFFF5CE8),
                image: DecorationImage(
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                  fit: BoxFit.fitWidth, //ทำให้รูปพอดีกับหน้าจอ
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
                    SearchBar(),
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
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetaliScreens();
                                }),
                              );
                            },
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
