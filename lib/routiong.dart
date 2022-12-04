import 'package:flutter/material.dart';
import 'package:youtube_apis/feautres/registeration/presenation/login_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/new_password_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/reset_password_screen.dart';

import 'core/constants/routes_manager.dart';
import 'core/constants/strings.dart';
import 'feautres/registeration/presenation/SignUpScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
     final args = settings.arguments;
    switch (settings.name) {
       case AppRoutes.mainRoute:
         return MaterialPageRoute(builder: (_) => LoginScreen());
         //case morning azkar route
        case AppRoutes.newPassword:
          return MaterialPageRoute(builder: (_) => NewPasswordScreen());
          //case evening azkar
        case AppRoutes.resetCode:
          return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
          //case sleep azkar
        case AppRoutes.signUp:
          return MaterialPageRoute(builder: (_) =>SignUpScreen());
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
