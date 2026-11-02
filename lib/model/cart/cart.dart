class Cart {
  final String? id;
  final String? name;
  final double? price;
  int? quantity;
  final List<String>? images;

  Cart({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<String> imageData = [];
    for (final temp in json['image']) {
      imageData.addAll(temp);
    }
    return Cart(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
      images: imageData,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': images,
    };
  }
}
