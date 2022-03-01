

import 'package:flutter/material.dart';
import 'package:hotel_menu/controller/menu_controller.dart';
import 'package:hotel_menu/widget/explore_header.dart';
import 'package:hotel_menu/widget/explore_side_menu.dart';
import 'package:hotel_menu/widget/product_card.dart';
import 'package:provider/provider.dart';

import '../responsive.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: const ExploreSideMenu(),
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          actions: const [
            Expanded(
              child: Header(),
            ),
          ],
        ),
        body: Row(
          children: [
            if (Responsive.isDesktop(context)) const ExploreSideMenu(),
            Expanded(
              flex: 5,
              child: Responsive(
                mobile: ProductCard(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                ),
                tablet: const ProductCard(
                    //childAspectRatio: _size.width >= 1010 ? 1.1 : 1.1,
                    ),
                desktop: ProductCard(
                  childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
