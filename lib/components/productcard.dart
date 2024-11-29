import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/screens/product_screen.dart';
import 'package:getxapp/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final ImageProvider imageUrl;
  final String brandName;
  final double price;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.brandName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsPage(
              title: title,
              imageUrl: imageUrl,
              brandName: brandName,
              price: price,
            ));
      },
      child: Card(
        color: AppColors.primary2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                brandName,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
