import 'package:flutter/material.dart';
import 'package:shop_app/helpers/sortby_enum.dart';
import '../../services/stores.dart';

class ProductFilterScreen extends StatelessWidget {
  final String selectedStore;
  final SortBy selectedSort;
  final ValueChanged<String?> onStoreChanged;
  final ValueChanged<SortBy?> onSortChanged;

  ProductFilterScreen({
    required this.selectedStore,
    required this.selectedSort,
    required this.onStoreChanged,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filter Products:'),
          FutureBuilder<List<String>>(
            future: StoreService.fetchStores(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show loading indicator while fetching stores
              } else if (snapshot.hasError) {
                return Text('Error loading stores: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No stores available');
              } else {
                return Row(
                  children: [
                    Text('Select Store:'),
                    DropdownButton<String>(
                      value: selectedStore,
                      onChanged: onStoreChanged,
                      items: snapshot.data!
                          .map((store) => DropdownMenuItem<String>(
                                value: store,
                                child: Text(store),
                              ))
                          .toList(),
                    ),
                  ],
                );
              }
            },
          ),
          Row(
            children: [
              Text('Sort By:'),
              DropdownButton<SortBy>(
                value: selectedSort,
                onChanged: onSortChanged,
                items: [
                  DropdownMenuItem(
                    value: SortBy.Alphabetical,
                    child: Text('Alphabetical'),
                  ),
                  DropdownMenuItem(
                    value: SortBy.PriceLowToHigh,
                    child: Text('Price Low to High'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
