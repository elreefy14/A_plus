import 'package:flutter/material.dart';
import 'package:youtube_apis/feautres/onboarding/splash_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/login_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/new_password_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/reset_password_screen.dart';

import 'core/constants/routes_manager.dart';
import 'core/constants/strings.dart';
import 'feautres/home/presenation/Menu.dart';
import 'feautres/home/presenation/home.dart';
import 'feautres/home/presenation/zoom_drawer.dart';
import 'feautres/notification/presenation/notification_screen.dart';
import 'feautres/payment/presenation/payment_screen.dart';
import 'feautres/registeration/presenation/SignUpScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     final args = settings.arguments;
    switch (settings.name) {
      //  static const String mainRoute = "/main";
    //   static const String login = "/login";
    //   static const String newPassword = "/newPassword";
    //   static const String resetCode = "/resetCode";
    //   static const String resetPassword = "/resetPassword";
    //   static const String signUp = "/signup";
    //   //zoom
    //   static const String zoom = "/zoom";
    //   //home
    //   static const String home = "/home";
    //   //menu
    //   static const String menu = "/menu";
    //   //notification
    //   static const String notification = "/notification";
    // static const String splashScreen = "/splashScreen";
    case AppRoutes.splashScreen:
          return MaterialPageRoute(builder: (_) =>SplashScreen());
        case AppRoutes.signUp:
          return MaterialPageRoute(builder: (_) =>SignUpScreen());
        case AppRoutes.login:
          return MaterialPageRoute(builder: (_) =>LoginScreen());
    //    case AppRoutes.newPassword:
  //        return MaterialPageRoute(builder: (_) =>NewPasswordScreen());
  //      case AppRoutes.resetPassword:
   //       return MaterialPageRoute(builder: (_) =>ResetPasswordScreen());
      //  case AppRoutes.resetCode:
      //    return MaterialPageRoute(builder: (_) =>ResetCodeScreen());
        case AppRoutes.zoom:
          return MaterialPageRoute(builder: (_) =>ZoomScreen());
        case AppRoutes.home:
          return MaterialPageRoute(builder: (_) =>HomeScreen());
        case AppRoutes.menu:
          return MaterialPageRoute(builder: (_) =>MenuScreen());
        case AppRoutes.notification:
          return MaterialPageRoute(builder: (_) =>NotificationScreen());
          //payment screen
        case AppRoutes.payment:
          return MaterialPageRoute(builder: (_) =>PaymentScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRoutes),
        ),
        body: const Center(
          child: Text(AppStrings.noRoutes),
        ),
      );
    });
  }
}
