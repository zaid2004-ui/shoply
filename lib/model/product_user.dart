class ProductUser {
  final String id;
  final String name;
  final double price;
  final String currency;
  final String category;
  final String brand;
  final int stock;
  final bool inStock;
  final String description;
  final String image;

  ProductUser({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.category,
    required this.brand,
    required this.stock,
    required this.inStock,
    required this.description,
    required this.image,
  });

  factory ProductUser.fromJson(Map<String, dynamic> json) {
    return ProductUser(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      category: json['category'],
      brand: json['brand'],
      stock: json['stock'],
      inStock: json['in_stock'],
      description: json['description'],
      image: json['image'],
    );
  }
}
