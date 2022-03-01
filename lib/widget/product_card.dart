import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu/model/food_category.dart';
import 'package:hotel_menu/model/product.dart';
import 'package:hotel_menu/services/api_services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'product_item.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel>(
      future: ApiServices.getProducts(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return FadeInDown(
            child: GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: widget.childAspectRatio,
              ),
              itemBuilder: (context, index) {
                var product = snapshot.data!.data![index];
                return InkWell(
                  onTap: () {
                    _showModelSheet(context);
                  },
                  child: ProductItem(
                    image: product.image1!,
                    name: product.productName!,
                    price: product.salePrice!,
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // return FadeInDown(
    //   child: GridView.builder(
    //     // physics: const NeverScrollableScrollPhysics(),
    //     controller: _scrollController,
    //     padding: const EdgeInsets.all(10),
    //     shrinkWrap: true,
    //     itemCount: products.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: widget.crossAxisCount,
    //       crossAxisSpacing: 16.0,
    //       mainAxisSpacing: 16.0,
    //       childAspectRatio: widget.childAspectRatio,
    //     ),
    //     itemBuilder: (context, index) => InkWell(
    //       onTap: () {
    //         _showModelSheet(context);
    //       },
    //       child: ProductItem(product: products[index]),
    //     ),
    //   ),
    // );
  }

  _showModelSheet(BuildContext context) {
    return showBarModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (ctx) => const CategoryCheckBox(),
    );
  }
}

class CategoryCheckBox extends StatefulWidget {
  const CategoryCheckBox({Key? key}) : super(key: key);

  @override
  _CategoryCheckBoxState createState() => _CategoryCheckBoxState();
}

class _CategoryCheckBoxState extends State<CategoryCheckBox> {
  final categorys = [
    CategoryList(title: 'Full'),
    CategoryList(title: 'Half'),
  ];
  int count = 1;
  void updateCount(int addValue) {
    if (count + addValue > 0) {
      setState(() {
        count += addValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Select Category',
          //   style: Theme.of(context).textTheme.bodyText2,
          // ),
          ...categorys.map(buildSingleCheckbox).toList(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              primary: Colors.amber,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(CategoryList category) => buildCheckbox(
        category: category,
        onClicked: () => setState(() {
          final newValue = !category.value;
          category.value = newValue;
          if (!newValue) {
          } else {
            categorys.every((notification) => notification.value);
          }
        }),
      );

  Widget buildCheckbox({
    required CategoryList category,
    required VoidCallback onClicked,
  }) =>
      // CheckboxListTile(
      //   value: category.value,
      //   onChanged: (value) => onClicked(),
      //   tristate: true,
      //   title: Text(
      //     category.title,
      //     style: const TextStyle(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // );
      Card(
        elevation: 0,
        child: ListTile(
          leading: Checkbox(
            value: category.value,
            onChanged: (value) => onClicked(),
          ),
          title: Text(
            category.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.remove),
                  onPressed: () => updateCount(-1),
                ),
              ),
              SizedBox(
                width: 25,
                child: Center(
                  child: Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.add),
                  onPressed: () => updateCount(1),
                ),
              ),
            ],
          ),
        ),
      );
}
