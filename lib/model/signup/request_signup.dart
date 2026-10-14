class RequestSignup {
  final String name;
  final String email;
  final String phone;
  final String? uid;
  final String? profileImage;

  RequestSignup({
    required this.name,
    required this.email,
    required this.phone,
    this.uid,
    this.profileImage,
  });

  RequestSignup copyWith({String? uid, String? profileImage}) {
    return RequestSignup(
      name: name,
      email: email,
      phone: phone,
      uid: uid ?? this.uid,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'phone': phone,
    'profileImage': profileImage,
  };
}
