import 'package:flutter/material.dart';
import 'package:guess/pages/dice/dice_page.dart';
import 'package:guess/pages/fruit/fruit_page.dart';
import 'package:guess/pages/home/home_page.dart';
import 'package:guess/pages/login/login_page.dart';
import 'package:guess/pages/login/register_page.dart';
import 'package:guess/pages/logo_page.dart';
import 'package:guess/pages/m10/m10_page.dart';
import 'package:guess/pages/racecourse/racecourse_page.dart';
import 'package:guess/pages/turntable/turntable_page.dart';
import 'package:guess/pages/very32/very32_view.dart';

class MyRouters {
  static const String logo = "/";
  static const String home = "home_page";
  static const String login = "login_page";
  static const String register = "register_page";
  static const String turntable = "turntable_page";
  static const String dice = "dice_page";
  static const String racecourse = "racecourse_page";
  static const String fruit = "fruit_page";
  static const String m10 = "m10_page";
  static const String very32 = "very32_page";

  static Map<String, WidgetBuilder> routes = {
    "/":(context) => const LogoPage(),
    "home_page":(context) => const HomePage(),
    "login_page":(context) => const LoginPage(),
    "register_page":(context) => const RegisterPage(),
    "dice_page":(context) => const DicePage(),
    "turntable_page":(context) => const TurntablePage(),
    "racecourse_page":(context) => const RacecoursePage(),
    "fruit_page":(context) => const FruitPage(),
    "m10_page":(context) => const M10Page(),
    "very32_page":(context) => const Very32Page(),
  };

}