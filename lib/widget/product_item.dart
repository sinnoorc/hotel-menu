import 'package:flutter/material.dart';
import 'package:hotel_menu/constants/app_url.dart';

import '../responsive.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);
  final String image, name, price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context) ? 200 : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(ConstUrl.productImage + image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.8],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '₹ $price',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
