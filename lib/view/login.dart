import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/uttils/color.dart';
import 'package:lms/uttils/container_style.dart';
import 'package:lms/uttils/font_style.dart';
import 'package:lms/uttils/paramitors.dart';
import 'package:lms/uttils/show_pop_up.dart';
import 'package:lms/viewModel/sign_in_auth.dart';
import 'package:vibration/vibration.dart';

class login_signup extends StatelessWidget {
  login_signup({super.key});
  TextEditingController registrationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // Auth _auth = Get.put(Auth());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              child: IconButton(
                  onPressed: () {
                    Vibration.vibrate(duration: vibratioDuration);
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.85),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Log in",
                  style: Fontstyle.getHeading(screenWidth),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.47, top: screenHeight * 0.05),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/login.png",
                  height: screenHeight * 0.32,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: registrationController,
                        decoration: InputDecoration(
                          labelText: 'Registration',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          // labelStyle: Fontstyle.getSubHeading(screenWidth)
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.045),
                      InkWell(
                        onTap: () {
                          Vibration.vibrate(duration: vibratioDuration);
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          width: double.infinity,
                          decoration: ContainerDesigns.simpleContainer(
                              color: buttonColor),
                          child: Center(
                              child: Text(
                            "Log in",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.025),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "or",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      InkWell(
                        onTap: () async {
                          Vibration.vibrate(duration: vibratioDuration);
                          showCustomPopup(context);
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          width: double.infinity,
                          decoration: ContainerDesigns.simpleContainer(
                              borderWidth: screenWidth * 0.003,
                              borderColor: buttonColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google.png",
                                height: screenHeight * 0.042,
                              ),
                              SizedBox(
                                width: screenWidth * 0.065,
                              ),
                              Text(
                                "Log in with Google",
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: blackBGcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
