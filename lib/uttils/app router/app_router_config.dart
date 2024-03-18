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
  
  MyRoutersClass._();

  static String initial = "/home";

// Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellroot');
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorEvent =
      GlobalKey<NavigatorState>(debugLabel: 'shellEvent');
  static final _shellNavigatorChat =
      GlobalKey<NavigatorState>(debugLabel: 'shellChat');
  static final _shellNavigatorAccount =
      GlobalKey<NavigatorState>(debugLabel: 'shellAccount');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  static final GoRouter router = GoRouter(
    // initialLocation: AppRouteName.welcomePath,
      initialLocation: initial,

    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [


      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return navbar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[

          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName.home,
                path: '/home',
                builder: (context, state) => home(),
                routes: [
                  GoRoute(
                    name: AppRouteName.subjectInfo,
                    path: 'subject_info',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      child: subject_info(),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) =>FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /// Brach event
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEvent,
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName.event,
                path: '/event',
                builder: (context, state) => event(),

                // add sub router's
                
              ),
            ],
          ),

          /// Brach chat
          StatefulShellBranch(
            navigatorKey: _shellNavigatorChat,
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName.chat,
                path: '/chat',
                builder: (context, state) => chat(),

                // add sub router's
                
              ),
            ],
          ),

          /// Brach account
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAccount,
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName.account,
                path: '/account',
                builder: (context, state) => account(),

                // add sub router's
                
              ),
            ],
          ),


        ],
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        name: AppRouteName.welcome,
        builder: (context, state) => welcom_page(
          key: state.pageKey,
        ),
        routes: [
          GoRoute(
            name: AppRouteName.login_signup,
            path: 'login_signup',
            builder: (context, state) => login_signup(),
          ),
        ],
      )
    //   GoRoute(
    //     name: AppRouteName.welcome,
    //     path: '/',
    //     builder: (context, state) =>
    //         welcom_page(), // Assuming welcom_page is a widget
        // routes: [
        //   GoRoute(
        //     name: AppRouteName.login_signup,
        //     path: 'login_signup',
        //     builder: (context, state) => login_signup(),
        //   ),
        // ],
    //   ),
    //   GoRoute(
    //     name: AppRouteName.navbar,
    //     path: '/navbar',
    //     builder: (context, state) => navbar(),
    //     routes: [
    //       GoRoute(
    //         name: 'home',
    //         path: 'home',
    //         builder: (context, state) => home(),
    //         routes: [
    //           GoRoute(
    //             name: 'subject_info',
    //             path: 'subject_info',
    //             builder: (context, state) => subject_info(),
    //           ),
    //         ],
    //       ),
    //       GoRoute(
    //         name: 'event',
    //         path: 'event',
    //         builder: (context, state) => event(),
    //       ),
    //       GoRoute(
    //         name: 'chat',
    //         path: 'chat',
    //         builder: (context, state) => chat(),
    //       ),
    //       GoRoute(
    //         name: 'account',
    //         path: 'account',
    //         builder: (context, state) => account(),
    //       ),
    //     ],
    //   ),
    ],
    redirect: (context, state) {
      bool isAuthenticated = false;

      if (isAuthenticated == true) {
        return '/navbar';
      } else {
        return '/home';
      }
    },
  );
}
