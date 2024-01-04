import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/services/products.dart';
import 'package:shop_app/services/stores.dart';

class CreateProductScreen extends StatefulWidget {
  final String? storeId;
  CreateProductScreen(this.storeId);
  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            SizedBox(height: 16),
            _image != null
                ? Image.file(
                    _image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final productName = _nameController.text;
                final productPrice = _priceController.text;
                final storeId = widget.storeId;
                if (productName.isNotEmpty && productPrice.isNotEmpty) {
                  try {
                    final bool success = await StoreService.addProduct(
                      productName,
                      productPrice,
                      _image!,
                      storeId!,
                    );

                    if (success) {
                      // Product creation successful, you can navigate to another screen or show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product created successfully')),
                      );
                    } else {
                      // Product creation failed, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to create product')),
                      );
                    }
                  } catch (error) {
                    // Handle errors
                    print('Error creating product: $error');
                  }

                  // Reset the form
                  _nameController.clear();
                  _priceController.clear();
                  setState(() {
                    _image = null;
                  });
                } else {
                  // Show an error message if any field is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Please fill in all fields and select an image')),
                  );
                }
              },
              child: Text('Create Product'),
            ),
          ],
        ),
      ),
    );
  }
}
