import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_page/home_page.dart';
import '../market_page/market_main_page.dart';

import '../app_config/Tcolor.dart';
import 'navbar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});


  //Navbar Screens
  List<Widget> _buildScreens() {
    return [
      const HomePage(title: "title"),
      const MarketMainPage(title: "title"),
      const HomePage(title: "title"),
      const MarketMainPage(title: "title"),
      const HomePage(title: "title"),
    ];
  }

  // Navbar Item
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      //Home Bottom
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        iconSize: 25,
        title: ("Home"),
        activeColorPrimary: TColor.menuFocus,
        inactiveColorPrimary: TColor.menuNormal,

      ),


      //Market Bottom
      PersistentBottomNavBarItem(
        icon:  const Icon(CupertinoIcons.graph_square),
        iconSize: 25,
        title: ("Market"),
        activeColorPrimary: TColor.menuFocus,
        inactiveColorPrimary: TColor.menuNormal,

      ),
      //Market Bottom
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.filter),
        iconSize: 20,
        title: ("Back Testing"),
        activeColorPrimary: TColor.menuFocus,
        inactiveColorPrimary: TColor.menuNormal,

      ),
      //Market Bottom
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: ("Subscription"),
        activeColorPrimary: TColor.menuFocus,
        inactiveColorPrimary: TColor.menuNormal,

      ),
      //Market Bottom
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bars),
        title: ("Menu"),
        activeColorPrimary: TColor.menuFocus,
        inactiveColorPrimary: TColor.menuNormal,



      ),

    ];
  }


  @override
  Widget build(BuildContext context) {

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      appBar: const AppBarWidget(),

      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 5),
        backgroundColor: TColor.primaryLight,
        isVisible: true,

        confineToSafeArea: true,
        navBarHeight: 60,
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property
      ),
    );
  }

  
}