import 'package:sample_app/screens/home_screen.dart';
import 'package:sample_app/screens/login_screen.dart';
import 'package:sample_app/screens/register_screen.dart';
import 'package:sample_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => SplashScreenView(
                  navigateRoute: LoginScreen(),
                  duration: 4000,
                  imageSize: 130,
                  imageSrc: "images/logo.png",
                  backgroundColor: Colors.purple.shade300,
                ));

      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  navIndex: 0,
                ));
      case productDetailsRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case cartRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  navIndex: 1,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreenView(
                  navigateRoute: LoginScreen(),
                  duration: 3000,
                  imageSize: 4000,
                  imageSrc: "images/logo.png",
                  backgroundColor: Colors.purple,
                  text: "Sample App",
                  textType: TextType.TyperAnimatedText,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                  ),
                ));
    }
  }
}
