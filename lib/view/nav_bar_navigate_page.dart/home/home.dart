import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/model/image_text.dart';
import 'package:lms/uttils/app%20router/app_router_config.dart';
import 'package:lms/uttils/app%20router/app_router_static_name.dart';
import 'package:lms/uttils/color.dart';
import 'package:lms/uttils/container_style.dart';
import 'package:lms/uttils/font_style.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/home/subject_display.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double percentage = 0.65; // Your percentage value here

    return Scaffold(
      backgroundColor: backLightColor,
      appBar: AppBar(
        backgroundColor: backLightColor,
        title: Text(
          "Hi, Amit",
          style: Fontstyle.title(screenWidth),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_bubble_outline,
              color: grey,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://media.licdn.com/dms/image/D4D03AQHWKO3uQaPt-w/profile-displayphoto-shrink_800_800/0/1684072769454?e=2147483647&v=beta&t=DpfQS1EBV92evzVYp2DHs0dTFyzo0S-zPM7YSiBo9Qk",
            ),
          ),
          SizedBox(
            width: screenWidth * 0.02,
          )
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                height: screenHeight * 0.15,
                decoration: ContainerDesigns.simpleContainer(
                    borderColor: containerLightColor,
                    borderWidth: screenWidth * 0.005),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.015),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: screenWidth * 0.02,
                      // ),
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          "https://media.licdn.com/dms/image/D4D03AQHWKO3uQaPt-w/profile-displayphoto-shrink_800_800/0/1684072769454?e=2147483647&v=beta&t=DpfQS1EBV92evzVYp2DHs0dTFyzo0S-zPM7YSiBo9Qk",
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amit Barai",
                            style: Fontstyle.title(screenWidth),
                          ),
                          Text(
                            "Dept - MCA",
                            style: Fontstyle.SubTitle(screenWidth),
                          ),
                          Text(
                            "Reg - 3256545582252225",
                            style: Fontstyle.SubTitle(screenWidth),
                          ),
                          Text(
                            "Roll - MCA-2023-003",
                            style: Fontstyle.SubTitle(screenWidth),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.07,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: screenWidth * 0.08,
                            percent: percentage,
                            animation: true,
                            animationDuration: 1700,
                            progressColor: getColor(percentage),
                            backgroundColor: containerLightColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${(percentage * 100).toInt()}%",
                              style: Fontstyle.SubTitle(screenWidth),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            "Absent",
                            style: Fontstyle.SubTitle(screenWidth),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Add initial padding
                    SizedBox(
                      width: screenWidth * 0.94, // Adjust the width as needed
                      height: screenHeight * 0.2,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: Models.homeSubjectBannerImage
                            .length, // Number of containers

                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // context.goNamed(AppRouteName.login_signup);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => subject_info()));
                              debugPrint("press ${index}");
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: Container(
                                decoration: ContainerDesigns.simpleContainer(
                                  color: containerLightColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    Models.homeSubjectBannerImage[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Add final padding
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: Models.homeSubjectBannerImage.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: buttonColor,
                      dotHeight: screenHeight * 0.008,
                      dotWidth: screenWidth * 0.02,
                      spacing: screenWidth * 0.02),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
