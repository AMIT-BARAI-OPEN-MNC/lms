import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/uttils/app%20router/app_router_static_name.dart';
import 'package:lms/view/login.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/account/account.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/event/event.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/chat/chat.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/home/home.dart';
import 'package:lms/view/nav_bar_navigate_page.dart/home/subject_display.dart';
import 'package:lms/view/navbarPage.dart';
import 'package:lms/view/welcome_page.dart';

class MyRoutersClass {
  final MaterialApp android = MaterialApp();
  final CupertinoApp ios = CupertinoApp();

  GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: welcom_page());
        },
      ),
      // GoRoute(
      //   name: AppRouteName.welcome,
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const welcom_page();
      //   },
      // ),
      GoRoute(
        name: AppRouteName.login_signup,
        path: '/login_signup',
        builder: (BuildContext context, GoRouterState state) {
          return login_signup();
        },
      ),
      GoRoute(
        name: AppRouteName.home,
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return home();
        },
      ),
      GoRoute(
        name: AppRouteName.book,
        path: '/event',
        builder: (BuildContext context, GoRouterState state) {
          return event();
        },
      ),
      GoRoute(
        name: AppRouteName.chat,
        path: '/chat',
        builder: (BuildContext context, GoRouterState state) {
          return chat();
        },
      ),
      GoRoute(
        name: AppRouteName.account,
        path: '/account',
        builder: (BuildContext context, GoRouterState state) {
          return account();
        },
      ),
      GoRoute(
        name: AppRouteName.navbar,
        path: '/navbar',
        builder: (BuildContext context, GoRouterState state) {
          return navbar();
        },
      ),
      GoRoute(
        name: AppRouteName.subjectInfo,
        path: '/subject_info',
        builder: (BuildContext context, GoRouterState state) {
          return subject_info();
        },
      ),
      // GoRoute(
      //   name: AppRouteName.subjectInfo,
      //   path: '/subject_info',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: subject_info());
      //   },
      // ),
    ],
    redirect: (context, state) {
      bool isAuthenticated = true;

      if (isAuthenticated == true) {
        return '/navbar';
      } else {
        return '/';
      }
    },
  );
}
