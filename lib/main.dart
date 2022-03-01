import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_menu/routes.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controller/menu_controller.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuController>(
          create: (_) => MenuController(),
        ),
      ],
      child: MaterialApp(
        title: 'My Restaurant',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: const Color(0xfff8f9fd),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarTextStyle: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
            bodyColor: Colors.black,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: customRoutes,
      ),
    );
  }
}
