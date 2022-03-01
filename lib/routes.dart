import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/splash_screen.dart';
import 'screen/table_screen.dart';
import 'screen/explore_screen.dart';
import 'screen/login_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/table': (context) => const TableScreen(),
  '/explore': (context) => const ExploreScreen(),
};
