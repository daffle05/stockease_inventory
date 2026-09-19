import '../models/product.dart';

class ProductData {
  static final List<Product> products = [
    Product(
      id: '1',
      name: 'Wireless Mouse',
      category: 'Electronics',
      price: 650,
      stock: 45,
    ),
    Product(
      id: '2',
      name: 'USB Keyboard',
      category: 'Electronics',
      price: 850,
      stock: 8,
    ),
    Product(
      id: '3',
      name: 'Office Chair',
      category: 'Furniture',
      price: 3500,
      stock: 15,
    ),
    Product(
      id: '4',
      name: 'Printer Ink',
      category: 'Supplies',
      price: 1200,
      stock: 0,
    ),
  ];

  static void addProduct(Product product) {
    products.add(product);
  }
}