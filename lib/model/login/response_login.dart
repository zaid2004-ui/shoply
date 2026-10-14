class ResponseLogin {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String profileImage;

  ResponseLogin({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.profileImage,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) {
    return ResponseLogin(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'name': name,
    'phone': phone,
    'profileImage': profileImage,
  };
}
