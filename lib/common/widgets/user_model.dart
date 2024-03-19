import 'package:flutter/material.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phone;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phone,
  });

  String get fullname => '$firstname $lastname';

  // String get formattedPhone => TFormatter.formatPhoen;

  static List<String> nameParts(fullname) => fullname.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[0].toLowerCase() : "";

    String camelCaseUsername = "$firstname$lastname";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "", firstname: "", lastname: "", username: "", email: "", phone: "");

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": email,
      "phone": phone,
    };
  }


}
