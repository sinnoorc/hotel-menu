// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu/controller/menu_controller.dart';
import 'package:provider/src/provider.dart';

import '../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

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
          if (Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          const SizedBox(width: 30),
          if (!Responsive.isMobile(context))
            Text(
              "Explore",
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          const Expanded(child: SearchField()),
          const CartButton(),
          // if (!Responsive.isDesktop(context))
          //   Padding(
          //     padding: const EdgeInsets.only(left: 5),
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         minimumSize: const Size.square(55),
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //       ),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       child: const Icon(CupertinoIcons.back),
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      // child: ElevatedButton.icon(
      //   style: ElevatedButton.styleFrom(
      //     minimumSize: const Size.square(55),
      //     primary: const Color(0xFFFFC107),
      //     onPrimary: Colors.white,
      //   ),
      //   onPressed: () {},
      //   icon: const Icon(Icons.shopping_cart_outlined),
      //   label: const Text('Cart'),
      // ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart_outlined),
        onPressed: () {},
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.only(left: 16),
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 16,
    //     vertical: 15,
    //   ),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: const BorderRadius.all(Radius.circular(10)),
    //     border: Border.all(color: Colors.white10),
    //   ),
    //   child: Row(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 12),
    //         child: Text(
    //           "Cart",
    //           style: Theme.of(context).textTheme.caption!.copyWith(
    //                 color: Colors.black,
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //         ),
    //       ),
    //       const Icon(Icons.shopping_cart_outlined),
    //     ],
    //   ),
    // );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: const Color(0xfff8f9fd),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        suffixIcon: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   color: Colors.red,
    //   child: TextField(
    //     decoration: InputDecoration(
    //       border: InputBorder.none,
    //       hintText: 'Search',
    //     ),
    //   ),
    // );
  }
}
