//
// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
// import 'package:management_states/library/config/routes_names.dart';
// import 'package:management_states/views/exam/init_exam.dart';
// import 'package:management_states/views/home/home_page.dart';
// import 'package:management_states/views/auth/login_page.dart';
// import 'package:management_states/views/auth/register_page.dart';
// import 'package:management_states/views/math/math_page.dart';
// import 'package:management_states/views/on_run_app/error_page.dart';
// import 'package:management_states/views/on_run_app/splashScreen.dart';
// import 'package:management_states/views/profile/profile_page.dart';
//
// class RouterScreens{
//
//
//
//   static final GoRouter router = GoRouter(
//       initialLocation: "/",
//       errorBuilder: (context, state) => const ErrorOpenPage(),
//       routes: [
//         GoRoute(
//             name: RoutesNames.splashScreen,
//             path: "/",builder: (context, state) => const SplashScreen()
//         ),
//         GoRoute(
//             name:RoutesNames.homePage,
//             path: "/home",
//             pageBuilder: (context, state) => CustomTransitionPage(
//                   key: state.pageKey,
//                   transitionDuration: const Duration(seconds: 1),
//                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                       child: child,
//                     );
//                   },
//                   child: const InitExamPage(level: 1)
//                 )
//         ),
//         GoRoute(
//             name:RoutesNames.mathPage,
//             path: "/mathPage",
//             pageBuilder: (context, state) => CustomTransitionPage(
//               key: state.pageKey,
//               transitionDuration: const Duration(seconds: 2),
//               transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//               child: MathPage(
//                 max: state.extra as int,
//                 row: (state.extra as Map<String, int>)['row']!,
//                 column: (state.extra as Map<String, int>)['column']!,
//                 seconds: (state.extra as Map<String, int>)['seconds']!,
//                 endRange: (state.extra as Map<String, int>)['endRange']!,
//               ),
//             )
//         ),
//         GoRoute(
//             name:RoutesNames.profilePage,
//             path: "/profilePage",
//             pageBuilder: (context, state) => CustomTransitionPage(
//               key: state.pageKey,
//               transitionDuration: const Duration(seconds: 2),
//               transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//               child: const ProfilePage(),
//             )
//         ),
//         GoRoute(
//             name:RoutesNames.logInPage,
//             path: "/logInPage",
//             pageBuilder: (context, state) => CustomTransitionPage(
//               key: state.pageKey,
//               transitionDuration: const Duration(seconds: 2),
//               transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//               child: const LogInPage(),
//             )
//         ),
//         GoRoute(
//             name:RoutesNames.registerPage,
//             path: "/registerPage",
//             pageBuilder: (context, state) => CustomTransitionPage(
//               key: state.pageKey,
//               transitionDuration: const Duration(seconds: 2),
//               transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity:CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//               child: const Register(),
//             )
//         ),
//       ]
//   );
//
//
// }
