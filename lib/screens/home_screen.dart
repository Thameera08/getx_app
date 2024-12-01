// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getxapp/components/categorycard.dart';
import 'package:getxapp/components/productcard.dart';
import 'package:getxapp/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary1,
        title: const Text(
          'Welcome to our Shop One ',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                // Add a search bar
                hintText: 'Search for products',
              ),
              SizedBox(height: 20),
              const Text(
                'Products Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.1, // Adjust height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Number of rows
                    crossAxisSpacing: 10.0, // Space between columns
                    mainAxisSpacing: 10.0, // Space between rows
                  ),
                  itemCount: 10, // Number of items
                  itemBuilder: (context, index) {
                    return Categorycard(
                      title: 'Product $index',
                      imageUrl: const AssetImage('lib/images/test.png'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Avilable Products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.63,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      title: 'Product $index',
                      imageUrl: const AssetImage('lib/images/test.png'),
                      brandName: 'Brand $index',
                      price: 10.00 * (index + 1),
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
}
