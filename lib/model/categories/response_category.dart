class ResponseCategory {
  final String? id;
  final String? name;
  final String? image;

  ResponseCategory({required this.id, required this.name, required this.image});

  factory ResponseCategory.fromJson(Map<String, dynamic> json) {
    return ResponseCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
