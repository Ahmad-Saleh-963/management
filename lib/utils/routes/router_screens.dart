
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:management_states/library/config/routes_names.dart';
import 'package:management_states/views/map/map_page.dart';
import 'package:management_states/views/auth/login_page.dart';
import 'package:management_states/views/auth/register_page.dart';
import 'package:management_states/views/generalNews/general_news.dart';
import 'package:management_states/views/on_run_app/error_page.dart';
import 'package:management_states/views/on_run_app/splashScreen.dart';
import 'package:management_states/views/profile/profile_page.dart';

class RouterScreens{



  static final GoRouter router = GoRouter(
      initialLocation: "/",
      errorBuilder: (context, state) => const ErrorOpenPage(),
      routes: [
        GoRoute(
            name: RoutesNames.splashScreen,
            path: "/",builder: (context, state) => const SplashScreen()
        ),
        GoRoute(
            name:RoutesNames.homePage,
            path: "/home",
            pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                      child: child,
                    );
                  },
                  child: const MapPage(), //MapBox(),
                )
        ),
        GoRoute(
            name:RoutesNames.profilePage,
            path: "/profilePage",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(seconds: 2),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
              child: const ProfilePage(),
            )
        ),
        GoRoute(
            name:RoutesNames.logInPage,
            path: "/logInPage",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(seconds: 2),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
              child: const LogInPage(),
            )
        ),
        GoRoute(
            name:RoutesNames.registerPage,
            path: "/registerPage",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(seconds: 2),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
              child: const Register(),
            )
        ),
        GoRoute(
            name:RoutesNames.generalNewsPage,
            path: "/generalNewsPage",
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(seconds: 2),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
              child: const GeneralNewsPage(),
            )
        ),

        // GoRoute(
        //     name:editPage,
        //     path: "/edite",
        //     pageBuilder: (context, state) {
        //       ItemsModel item = state.extra as ItemsModel;
        //       return CustomTransitionPage(
        //         key: state.pageKey,
        //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //           return FadeTransition(
        //             opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
        //             child: child,
        //           );
        //         },
        //         child: EditePost(item: item), // context.goNamed("sample",extra:sample);
        //       );
        //     }
        // ),
      ]
  );


}
