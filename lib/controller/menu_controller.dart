import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _homeScaffold = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<ScaffoldState> get homeScaffold => _homeScaffold;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
    if (_homeScaffold.currentState!.isDrawerOpen) {
      _homeScaffold.currentState!.openEndDrawer();
    }
  }
}
