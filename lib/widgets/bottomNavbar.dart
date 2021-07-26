import 'package:flutter/material.dart';
import 'package:flutter_app02/global.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function() press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? Global.kActiveIconColor : Global.kTextColor,
          ),
          Text(title,
              style: TextStyle(
                color: isActive ? Global.kActiveIconColor : Global.kTextColor,
              )),
        ],
      ),
    );
  }
}
