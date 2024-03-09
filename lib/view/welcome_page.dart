import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/main.dart';
import 'package:lms/model/image_text.dart';
import 'package:lms/uttils/app%20router/app_router_static_name.dart';
import 'package:lms/uttils/color.dart';
import 'package:lms/uttils/container_style.dart';
import 'package:lms/uttils/font_style.dart';
import 'package:lms/uttils/paramitors.dart';
import 'package:lms/uttils/show_pop_up.dart';
import 'package:lms/view/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vibration/vibration.dart';

class welcom_page extends StatefulWidget {
  const welcom_page({super.key});

  @override
  State<welcom_page> createState() => _welcom_pageState();
}

class _welcom_pageState extends State<welcom_page> {
  PageController _pageController = PageController();
  bool skipHide = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              itemCount: Models.welcomeImages.length,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {});
              },
              itemBuilder: (context, index) {
                skipHide = index == Models.welcomeImages.length - 1;

                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.2,
                    ),
                    Container(
                        height: screenHeight * 0.3,
                        child: Image.asset(
                          Models.welcomeImages[index],
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: screenHeight * 0.002,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Text(
                        Models.welcomeTextHeading[index],
                        style: Fontstyle.getHeading(screenWidth),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                      child: Text(
                        Models.welcomeTextSubHeading[index],
                        style: Fontstyle.getSubHeading(screenWidth),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.13,
                    ),
                    skipHide
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  showComingSoonPopup(context);
                                  Vibration.vibrate(duration: vibratioDuration);
                                },
                                child: Container(
                                  height: screenHeight * 0.07,
                                  width: screenWidth * 0.3,
                                  decoration: ContainerDesigns.simpleContainer(
                                      color: buttonColor),
                                  child: Center(
                                      child: Text(
                                    "Sign up",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.1,
                              ),
                              InkWell(
                                onTap: () {
                                  context.goNamed(AppRouteName.login_signup);
                                  Vibration.vibrate(duration: vibratioDuration);
                                },
                                child: Container(
                                  height: screenHeight * 0.07,
                                  width: screenWidth * 0.3,
                                  decoration: ContainerDesigns.simpleContainer(
                                      borderWidth: screenWidth * 0.005,
                                      borderColor: buttonColor),
                                  child: Center(
                                      child: Text(
                                    "Log in",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: buttonColor,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                );
              }),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.23),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: Models.welcomeImages.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: buttonColor,
                    dotHeight: screenHeight * 0.008,
                    dotWidth: screenWidth * 0.03,
                    spacing: screenWidth * 0.04),
              ),
            ),
          ),
          skipHide != true
              ? Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.1, right: screenWidth * 0.02),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _pageController
                                .jumpToPage(Models.welcomeImages.length - 1);
                          });
                        },
                        child: Text(
                          "Skip",
                          style: Fontstyle.getSubHeading(screenWidth),
                        ),
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
