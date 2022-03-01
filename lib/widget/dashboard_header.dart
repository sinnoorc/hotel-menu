// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:hotel_menu/controller/menu_controller.dart';
import 'package:provider/src/provider.dart';

import '../responsive.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          const SizedBox(width: 30),
          Text(
            "Home",
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
