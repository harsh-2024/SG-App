import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsg_new/profile.dart';
import 'package:tsg_new/scan.dart';

import 'cart.dart';
import 'homePage.dart';

class SGTV extends StatefulWidget {
  const SGTV({super.key});

  @override
  State<SGTV> createState() => _SGTVState();
}

class _SGTVState extends State<SGTV> {
  Future<bool> _shouldPop() async {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _shouldPop();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: setIconColor,
            onTap: (index) => setState(() {
                  selectedIndex = index;
                  switch (selectedIndex) {
                    case 0:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                      break;
                    case 1:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SGTV()));
                      break;
                    case 2:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Scanner()));
                      break;
                    case 3:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                      break;
                    case 4:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      break;

                    default:
                  }
                }),
            // onTap: null,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Image(image: AssetImage("assets/home_icon.png"))),
              BottomNavigationBarItem(
                  label: "SGTV",
                  icon: Image(image: AssetImage("assets/sg_tv_icon.png"))),
              BottomNavigationBarItem(
                  label: "Scan",
                  icon: Image(image: AssetImage("assets/scan_code_icon.png"))),
              BottomNavigationBarItem(
                  label: "Shop",
                  icon: Image(image: AssetImage("assets/cart_icon.png"))),
              BottomNavigationBarItem(
                label: "Menu",
                icon: Image(image: AssetImage("assets/profile_icon.png")),
              ),
            ]),
        appBar: AppBar(
          title: Text("SG TV",
              style: GoogleFonts.roboto(
                color: Color(0xffed1c24),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
        ),
      ),
    );
  }
}
