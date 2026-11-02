class ResponsSales {
  final String? id;
  final String? image;

  ResponsSales({required this.id, required this.image});
  factory ResponsSales.fromJson(Map<String, dynamic> json) {
    return ResponsSales(id: json['id'], image: json['image']);
  }
}
