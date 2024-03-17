class ProblemCause {
  List<dynamic>? name;
  List<dynamic>? email;
  List<dynamic>? password;
  List<dynamic>? cPassword;

  ProblemCause({this.name, this.email, this.password, this.cPassword});

  @override
  String toString() {
    return 'Data(name: ${name?[0]} ,email: ${email?[0]}, password: ${password?[0]}, cPassword: ${cPassword?[0]})';
  }

  factory ProblemCause.fromJson(Map<String, dynamic> json) => ProblemCause(
        name: json['name'] as List<dynamic>?,
        email: json['email'] as List<dynamic>?,
        password: json['password'] as List<dynamic>?,
        cPassword: json['c_password'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'c_password': cPassword,
      };
}
