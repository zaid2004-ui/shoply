class RequestLogin {
  final String email;
  final String password;

  RequestLogin({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
