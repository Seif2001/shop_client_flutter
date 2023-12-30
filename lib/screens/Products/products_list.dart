import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:shop_app/Models/product.dart';
import 'package:shop_app/helpers/sortby_enum.dart';
import 'package:shop_app/screens/Products/product_filter_screen.dart';
import '../../services/products.dart';

class ProductListWidget extends StatefulWidget {
  @override
  _ProductListWidget createState() => _ProductListWidget();
}

class _ProductListWidget extends State<ProductListWidget> {
  String selectedStore = 'All';
  SortBy selectedSort = SortBy.Alphabetical;
  List<Product> filteredAndSortedProducts = [];

  Future<void> _fetchProducts() async {
    try {
      final List<Product> products = await ProductService.fetchProducts(
        store: selectedStore,
        sortBy: selectedSort,
      );
      log('Products: $products');
      setState(() {
        filteredAndSortedProducts = products;
      });
    } catch (e) {
      // Handle errors
      print('Error fetching products: $e');
    }
  }

  void _showFilterScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ProductFilterScreen(
          selectedStore: selectedStore,
          selectedSort: selectedSort,
          onStoreChanged: (value) {
            setState(() {
              selectedStore = value!;
              _fetchProducts();
            });
          },
          onSortChanged: (value) {
            setState(() {
              selectedSort = value!;
              _fetchProducts();
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterScreen(context),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
          crossAxisSpacing: 8.0, // Set the horizontal spacing between columns
          mainAxisSpacing: 8.0, // Set the vertical spacing between rows
        ),
        itemCount: filteredAndSortedProducts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Image.asset(
                filteredAndSortedProducts[index].image,
                width: 100, // Set the desired width
                height: 100, // Set the desired height
                fit: BoxFit.cover, // Adjust the BoxFit property as needed
              ),
              SizedBox(height: 8),
              Text(
                filteredAndSortedProducts[index].name,
              ),
              Text(
                  '\$${filteredAndSortedProducts[index].price.toStringAsFixed(2)}'),
            ]),
          );
        },
      ),
    );
  }
}
