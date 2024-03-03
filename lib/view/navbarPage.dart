import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms/uttils/color.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/account/account.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/book/book.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/chat/chat.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/home/home.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;

  // Define pages to navigate to
  final List<Widget> _pages = [
    home(),
    book(),
    chat(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[_selectedIndex],
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
              },
              backgroundColor: backLightColor,
              tabBackgroundColor: Color.fromARGB(48, 131, 131, 131),
              gap: screenWidth * 0.02,
              padding: EdgeInsets.all(screenWidth * 0.04),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(icon: Icons.event_note, text: "Event"),
                GButton(icon: Icons.work_history_rounded, text: "Placement"),
                GButton(icon: Icons.person, text: "Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
