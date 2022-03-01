// ignore_for_file: implementation_imports

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu/constants/app_style.dart';
import 'package:hotel_menu/controller/menu_controller.dart';
import 'package:hotel_menu/model/home_menu.dart';
import 'package:hotel_menu/model/product.dart';
import 'package:hotel_menu/widget/drawer_widget.dart';
import 'package:hotel_menu/widget/home_screen_item.dart';
import 'package:hotel_menu/widget/product_card.dart';
import 'package:hotel_menu/widget/product_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/src/provider.dart';

import '../responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: context.read<MenuController>().homeScaffold,
        drawer: const DashBoardMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
            style: AppStyle.appBar,
          ),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.line_horizontal_3),
            onPressed: () => context.read<MenuController>().homeScaffold.currentState!.openDrawer(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/table'),
                child: const Text('Book Order'),
              ),
            ),
          ],
        ),
        body: FadeInDown(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Responsive(
                  mobile: MenuCard(
                    crossAxisCount: _size.width < 650 ? 2 : 4,
                    childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  ),
                  tablet: MenuCard(),
                  desktop: MenuCard(
                    childAspectRatio: _size.width < 1400 ? 1.3 : 1.3,
                  ),
                ),
                // const SizedBox(height: 15),
                // Text('Most Popular Item'.toUpperCase()),
                const SizedBox(height: 5),
                if (!Responsive.isMobile(context))
                  Responsive(
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
                // if (Responsive.isMobile(context))
                //   SizedBox(
                //     height: 200,
                //     child: ListView.separated(
                //       separatorBuilder: (context, index) => const SizedBox(width: 10),
                //       scrollDirection: Axis.horizontal,
                //       itemCount: products.length,
                //       itemBuilder: (context, index) => InkWell(
                //         onTap: () => _showModelSheet(context),
                //         child: ProductItem(
                //           product: products[index],
                //         ),
                //       ),
                //     ),
                //   ),
                // const SizedBox(height: 15),
                // Text('Most Trending Item'.toUpperCase()),
                // const SizedBox(height: 5),
                // if (!Responsive.isMobile(context))
                //   Responsive(
                //     mobile: ProductCard(
                //       crossAxisCount: _size.width < 650 ? 2 : 4,
                //       childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                //     ),
                //     tablet: const ProductCard(
                //         //childAspectRatio: _size.width >= 1010 ? 1.1 : 1.1,
                //         ),
                //     desktop: ProductCard(
                //       childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                //     ),
                //   ),
                // if (Responsive.isMobile(context))
                //   SizedBox(
                //     height: 200,
                //     child: ListView.separated(
                //       separatorBuilder: (context, index) => const SizedBox(width: 10),
                //       scrollDirection: Axis.horizontal,
                //       itemCount: products.length,
                //       itemBuilder: (context, index) => InkWell(
                //         onTap: () => _showModelSheet(context),
                //         child: ProductItem(
                //           product: products[index],
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/table'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

_showModelSheet(BuildContext context) {
  return showBarModalBottomSheet(
    context: context,
    builder: (ctx) => const CategoryCheckBox(),
  );
}

class MenuCard extends StatelessWidget {
  MenuCard({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      // padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: homeMenuCards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => HomeScreenItem(home: homeMenuCards[index]),
    );
  }
}
