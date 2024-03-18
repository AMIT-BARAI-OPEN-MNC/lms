import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lms/uttils/app%20router/app_router_config.dart';
import 'package:lms/viewModel/payment/payment_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform.isIOS
      // ? await Firebase.initializeApp()
      // : await Firebase.initializeApp(
      //     options: const FirebaseOptions(
      //       apiKey: "AIzaSyDXAnwnYwQOhvFXAjYXXFnA2Qj6QDOzM4w",
      //       // paste your api key here
      //       appId: "1:141742505264:android:954fdbf2911857075e5cf5",
      //       //paste your app id here
      //       messagingSenderId: "141742505264",
      //       //paste your messagingSenderId here
      //       projectId: "lms-c741b", //paste your project id here
      //     ),
      //   );
  // Obtain screen dimensions when the app starts
  // ignore: deprecated_member_use

  runApp(const MyApp());
}

enum AppRouteName { welcone_page, login_signup, navbar, home, ssubject_info, event, chat, account }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyRoutersClass.router,
        // routeInformationParser: MyRoutersClass().goRouter.routeInformationParser,
        // routerDelegate: MyRoutersClass().goRouter.routerDelegate,
        // defaultTransition: Transition.downToUp,
        // home: welcom_page(),
        // home: navbar(),
      ),
    );
  }
}
