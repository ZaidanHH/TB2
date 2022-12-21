import 'package:flutter/widgets.dart';

class Student {
  late final int id;
  final String name;
  final String nim;
  final String phone;
  final String email;

  Student({
    required this.id,
    required this.name,
    required this.nim,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'phone': phone,
      'email': email,
    };
  }
}
