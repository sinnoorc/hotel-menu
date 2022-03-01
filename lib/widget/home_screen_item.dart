import 'package:flutter/material.dart';
import 'package:hotel_menu/model/home_menu.dart';

import '../responsive.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem({
    Key? key,
    required this.home,
  }) : super(key: key);

  final HomeMenuCard home;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            home.image,
            width: Responsive.isMobile(context) ? 70 : 100,
            height: Responsive.isMobile(context) ? 70 : 100,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  home.title,
                  style: TextStyle(
                    fontSize: !Responsive.isDesktop(context) ? 13 : 25,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  home.subtitle,
                  style: TextStyle(
                    fontSize: !Responsive.isDesktop(context) ? 20 : 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
