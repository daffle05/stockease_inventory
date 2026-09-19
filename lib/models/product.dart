class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
  });

  String get status {
    if (stock == 0) {
      return 'Out of Stock';
    } else if (stock <= 10) {
      return 'Low Stock';
    } else {
      return 'Available';
    }
  }
}