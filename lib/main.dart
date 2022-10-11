import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tsg_new/cart.dart';
import 'package:tsg_new/profile.dart';
import 'package:tsg_new/scan.dart';
import 'package:tsg_new/sgTV.dart';
import 'blogs.dart';
import 'homePage.dart';
import 'landing.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'otpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[Text("this is the drawer")],
//           ),
//         ),
//       ),
//       body: PersistentTabView(
//         context,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         controller: _controller,
//       ),
//     );
//     // return PersistentTabView(
//     //   context,
//     //   controller: _controller,
//     //   screens: _buildScreens(),
//     //   items: _navBarsItems(),
//     //   confineInSafeArea: true,
//     //   backgroundColor: Colors.white, // Default is Colors.white.
//     //   handleAndroidBackButtonPress: true, // Default is true.
//     //   resizeToAvoidBottomInset:
//     //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//     //   stateManagement: true, // Default is true.
//     //   hideNavigationBarWhenKeyboardShows:
//     //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//     //   decoration: NavBarDecoration(
//     //     borderRadius: BorderRadius.circular(10.0),
//     //     colorBehindNavBar: Colors.white,
//     //   ),
//     //   popAllScreensOnTapOfSelectedTab: true,
//     //   popActionScreens: PopActionScreensType.all,
//     //   itemAnimationProperties: ItemAnimationProperties(
//     //     // Navigation Bar's items animation properties.
//     //     duration: Duration(milliseconds: 200),
//     //     curve: Curves.ease,
//     //   ),
//     //   screenTransitionAnimation: ScreenTransitionAnimation(
//     //     // Screen transition animation on change of selected tab.
//     //     animateTabTransition: true,
//     //     curve: Curves.ease,
//     //     duration: Duration(milliseconds: 200),
//     //   ),
//     //   navBarStyle:
//     //       NavBarStyle.style15, // Choose the nav bar style with this property.
//     // );
//   }
// }

// // This widget is the root of your application.
// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//       future: SharedPreferences.getInstance(),
//       builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
//         var x = prefs.data;
//         if (prefs.hasData) {
//           if (x!.getString('cookies') != "" &&
//               x.getString('cookies') != null &&
//               x.getString('email') != "" &&
//               x.getString('email') != null) {
//             print(x.getString('cookies'));
//             return MaterialApp(
//               title: 'Flutter Demo',
//               theme: ThemeData(
//                 primaryColor: Colors.redAccent[700],
//                 appBarTheme: AppBarTheme(color: Colors.black),
//                 visualDensity: VisualDensity.adaptivePlatformDensity,
//               ),
//               home: Scaffold(body: HomePage()),
//             );
//           } else {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Flutter Demo',
//               theme: ThemeData(
//                 primaryColor: Colors.redAccent[700],
//                 appBarTheme: AppBarTheme(color: Colors.black),
//                 visualDensity: VisualDensity.adaptivePlatformDensity,
//               ),
//               home: Scaffold(body: LoginPage()),
//             );
//           }
//         }
//         return MaterialApp(
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primaryColor: Colors.redAccent[700],
//             appBarTheme: AppBarTheme(color: Colors.black),
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//           home: Scaffold(body: Landing()),
//         );
//       });
// }

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.home),
//       title: ("Home"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("SG TV"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("Scan"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("Profile"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("cart"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//   ];
// }
