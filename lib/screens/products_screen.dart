import 'package:flutter/material.dart';

import '../data/product_data.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Header
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Product Management',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Manage your inventory products',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AddProductScreen(),
                      ),
                    );

                    // Refresh the screen after returning
                    setState(() {});
                  },

                  icon: const Icon(Icons.add),

                  label: const Text(
                    'Add Product',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon:
                    const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(8),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Product list
            Expanded(
              child: ListView.separated(
                itemCount:
                    ProductData.products.length,

                separatorBuilder:
                    (context, index) =>
                        const SizedBox(height: 12),

                itemBuilder: (context, index) {
                  final product =
                      ProductData.products[index];

                  return Card(
                    color: Colors.white,

                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),

                      // Product icon
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color(0xFFE0F2F1),

                        child: Text(
                          product.name[0]
                              .toUpperCase(),

                          style: const TextStyle(
                            color:
                                Color(0xFF00897B),

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      // Product name
                      title: Text(
                        product.name,

                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      // Category and price
                      subtitle: Text(
                        '${product.category} • ₱${product.price.toStringAsFixed(2)}',
                      ),

                      // Stock and status
                      trailing: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        crossAxisAlignment:
                            CrossAxisAlignment.end,

                        children: [
                          Text(
                            'Stock: ${product.stock}',

                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            product.status,

                            style: TextStyle(
                              color:
                                  _getStatusColor(
                                product.status,
                              ),

                              fontWeight:
                                  FontWeight.bold,

                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Available':
        return Colors.green;

      case 'Low Stock':
        return Colors.orange;

      case 'Out of Stock':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }
}