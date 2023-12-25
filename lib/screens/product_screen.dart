import 'package:flutter/material.dart';

import '../Models/product.dart';

List<Product> products = [
  Product(
      id: '1',
      name: 'Product 1',
      description: 'Description 1',
      price: 19.99,
      image: "assets/images/products/Nike/1.jpg"),
  Product(
      id: '1',
      name: 'Product 2',
      description: 'Description 2',
      price: 29.99,
      image: "assets/images/products/Nike/2.jpg"),
  Product(
      id: '1',
      name: 'Product 3',
      description: 'Description 1',
      price: 19.99,
      image: "assets/images/products/Nike/3.jpg"),
  Product(
      id: '1',
      name: 'Product 4',
      description: 'Description 2',
      price: 29.99,
      image: "assets/images/products/Nike/4.jpg"),
];

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
          crossAxisSpacing: 8.0, // Set the horizontal spacing between columns
          mainAxisSpacing: 8.0, // Set the vertical spacing between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Image.asset(
                products[index].image,
                width: 100, // Set the desired width
                height: 100, // Set the desired height
                fit: BoxFit.cover, // Adjust the BoxFit property as needed
              ),
              SizedBox(height: 8),
              Text(
                products[index].name,
              ),
              Text('\$${products[index].price.toStringAsFixed(2)}'),
            ]),
          );
        },
      ),
    );
  }
}
