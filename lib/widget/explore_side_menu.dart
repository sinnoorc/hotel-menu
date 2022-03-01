import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu/constants/app_url.dart';
import 'package:hotel_menu/model/category.dart';
import 'package:hotel_menu/services/api_services.dart';

import '../responsive.dart';

class ExploreSideMenu extends StatelessWidget {
  const ExploreSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Drawer(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            slivers: [
              if (!Responsive.isDesktop(context)) const SliverToBoxAdapter(child: SizedBox(height: 40)),
              SliverToBoxAdapter(
                child: FutureBuilder<CategoryModel>(
                  future: ApiServices.getCategories(),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data!.length,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(),
                        itemBuilder: (context, index) {
                          var category = snapshot.data!.data![index];
                          return DrawerCard(
                            title: category.name!,
                            imgUrl: category.icon!,
                            press: () {
                              print(category.id);
                            },
                          );
                        },
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => FadeInDown(child: const CupertinoActivityIndicator()),
                      separatorBuilder: (context, index) => const SizedBox(height: 100),
                      itemCount: 5,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}

class DrawerCard extends StatefulWidget {
  const DrawerCard({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.press,
  }) : super(key: key);

  final String title, imgUrl;
  final VoidCallback press;

  @override
  State<DrawerCard> createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (Responsive.isDesktop(context)) {
              widget.press();
            } else {
              widget.press();
              Navigator.pop(context);
            }
          },
          // splashColor: Colors.amber,
          // hoverColor: Colors.amber,
          // focusColor: Colors.amber,
          onHover: (value) {
            setState(() {
              _color = value ? Colors.amber : Colors.white;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    Image.network(
                      ConstUrl.categoryImage + widget.imgUrl,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _color.computeLuminance() > 0.7 ? Colors.black : Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
