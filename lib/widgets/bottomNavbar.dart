import 'package:flutter/material.dart';
import 'package:flutter_app02/global.dart';
import 'package:flutter_svg/svg.dart';

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
