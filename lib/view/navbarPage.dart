import 'package:flutter/material.dart';
import 'package:go_router/src/route.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms/uttils/color.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/account/account.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/event/event.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/chat/chat.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/home/home.dart';

class navbar extends StatefulWidget {
   navbar({Key? key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;

  // Define pages to navigate to

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  // final List<Widget> _pages = [
  //   home(),
  //   event(),
  //   chat(),
  //   account(),
  // ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,),
      // body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: backLightColor,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.02,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
            ),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _goBranch(_selectedIndex);
              },
              backgroundColor: backLightColor,
              tabBackgroundColor: Color.fromARGB(48, 131, 131, 131),
              gap: screenWidth * 0.02,
              padding: EdgeInsets.all(screenWidth * 0.04),
              tabs: [
                GButton(
                  haptic: true,
                  icon: Icons.home,
                  iconActiveColor: buttonColor,
                  text: "Home",
                ),
                GButton(
                    haptic: true,
                    icon: Icons.event_note,
                    iconActiveColor: buttonColor,
                    text: "Event"),
                GButton(
                    haptic: true,
                    icon: Icons.work_history_rounded,
                    iconActiveColor: buttonColor,
                    text: "Placement"),
                GButton(
                    haptic: true,
                    icon: Icons.person,
                    iconActiveColor: buttonColor,
                    text: "Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
