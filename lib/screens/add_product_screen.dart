import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() =>
      _AddProductScreenState();
}

class _AddProductScreenState
    extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _priceController =
      TextEditingController();

  final TextEditingController _stockController =
      TextEditingController();

  String _selectedCategory = 'Electronics';

  final List<String> _categories = [
    'Electronics',
    'Furniture',
    'Supplies',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();

    super.dispose();
  }

  void _saveProduct() {
    // Check if the form is valid
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Create a new Product
    final product = Product(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),

      name: _nameController.text.trim(),

      category: _selectedCategory,

      price: double.parse(
        _priceController.text,
      ),

      stock: int.parse(
        _stockController.text,
      ),
    );

    // Add product to our shared data
    ProductData.addProduct(product);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} added successfully!',
        ),
      ),
    );

    // Return to Products screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F7F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Add Product',

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),

          child: Container(
            width: 600,

            padding:
                const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(12),
            ),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Add New Product',

                    style: TextStyle(
                      fontSize: 26,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Enter the information for the new inventory item.',

                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // PRODUCT NAME
                  const Text(
                    'Product Name',

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller:
                        _nameController,

                    decoration:
                        InputDecoration(
                      hintText:
                          'e.g. Wireless Mouse',

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Please enter a product name';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // CATEGORY
                  const Text(
                    'Category',

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    value:
                        _selectedCategory,

                    decoration:
                        InputDecoration(
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                    ),

                    items:
                        _categories.map(
                      (category) {
                        return DropdownMenuItem<
                            String>(
                          value: category,

                          child:
                              Text(category),
                        );
                      },
                    ).toList(),

                    onChanged: (value) {
                      setState(() {
                        _selectedCategory =
                            value!;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // PRICE
                  const Text(
                    'Price',

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller:
                        _priceController,

                    keyboardType:
                        const TextInputType
                            .numberWithOptions(
                      decimal: true,
                    ),

                    decoration:
                        InputDecoration(
                      hintText:
                          'e.g. 650.00',

                      prefixText: '₱ ',

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Please enter a price';
                      }

                      if (double.tryParse(
                              value) ==
                          null) {
                        return 'Please enter a valid price';
                      }

                      if (double.parse(value) <
                          0) {
                        return 'Price cannot be negative';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // STOCK
                  const Text(
                    'Stock Quantity',

                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller:
                        _stockController,

                    keyboardType:
                        TextInputType.number,

                    decoration:
                        InputDecoration(
                      hintText: 'e.g. 50',

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Please enter stock quantity';
                      }

                      final stock =
                          int.tryParse(value);

                      if (stock == null) {
                        return 'Please enter a whole number';
                      }

                      if (stock < 0) {
                        return 'Stock cannot be negative';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child:
                            OutlinedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },

                          style:
                              OutlinedButton
                                  .styleFrom(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),
                          ),

                          child:
                              const Text(
                            'Cancel',
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 15,
                      ),

                      Expanded(
                        child:
                            ElevatedButton(
                          onPressed:
                              _saveProduct,

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                const Color(
                              0xFF16A085,
                            ),

                            foregroundColor:
                                Colors.white,

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),
                          ),

                          child:
                              const Text(
                            'Save Product',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}