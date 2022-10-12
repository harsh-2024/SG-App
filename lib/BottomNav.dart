import 'package:flutter/material.dart';
import 'package:tsg_new/webViewPage.dart';
import 'cart.dart';
import 'blogs.dart';
import 'scan.dart';
import 'homePage.dart';
import 'profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.blueAccent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
        height: 75,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: pageIndex == 0
                  ? Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/home_filled.png"),
                    )
                  : Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/home_button.png"),
                    ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllBlogs()));
              },
              child: Image(
                height: 30,
                width: 30,
                image: AssetImage("assets/sg_tv_icon_navBar.png"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Scanner()));
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/qr_button.png"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartWebView()));
              },
              child: pageIndex == 3
                  ? Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/cart_filled.png"),
                    )
                  : Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/cart_button.png"),
                    ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Image(
                height: 25,
                width: 25,
                image: AssetImage("assets/menu_button.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
