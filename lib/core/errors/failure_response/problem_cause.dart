class ProblemCause {
  String? error;
  List<dynamic>? name;
  List<dynamic>? email;
  List<dynamic>? password;
  List<dynamic>? cPassword;

  ProblemCause(
      {this.error, this.name, this.email, this.password, this.cPassword});

  @override
  String toString() {
    if (error != null) {
      return error!;
    } else if (name != null) {
      return name![0];
    } else if (email != null) {
      return email![0];
    } else if (password != null) {
      return password![0];
    } else if (cPassword != null) {
      return cPassword![0];
    } else {
      return '';
    }
  }

  factory ProblemCause.fromJson(Map<String, dynamic> json) => ProblemCause(
        error: json['error'] as String?,
        name: json['name'] as List<dynamic>?,
        email: json['email'] as List<dynamic>?,
        password: json['password'] as List<dynamic>?,
        cPassword: json['c_password'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'name': name,
        'email': email,
        'password': password,
        'c_password': cPassword,
      };
}
