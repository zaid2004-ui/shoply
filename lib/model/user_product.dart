class UserProduct {
  final int? id;
  final String? name;
  final String? userName;

  UserProduct({required this.id, required this.name, required this.userName});

  factory UserProduct.fromJson(Map<String, dynamic> json) {
    return UserProduct(
      id: json['id'],
      name: json['name'],
      userName: json['user_name'],
    );
  }
}
