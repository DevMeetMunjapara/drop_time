import 'dart:ffi';

class MyUser {
  String name;
  String email;
  String password;
  String number;
  String Time;

  MyUser({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
    required this.Time,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'number': number,
        'Time': Time,
      };

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      number: json['number'],
      Time: json['Time']);
}
