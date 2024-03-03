import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/view/navbarPage.dart';
import 'package:lms/view/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isIOS
      ? await Firebase.initializeApp()
      : await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDXAnwnYwQOhvFXAjYXXFnA2Qj6QDOzM4w",
            // paste your api key here
            appId: "1:141742505264:android:954fdbf2911857075e5cf5",
            //paste your app id here
            messagingSenderId: "141742505264",
            //paste your messagingSenderId here
            projectId: "lms-c741b", //paste your project id here
          ),
        );
  // Obtain screen dimensions when the app starts
  // ignore: deprecated_member_use

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.downToUp,
      home: welcom_page(),
      // home: navbar(),
    );
  }
}
