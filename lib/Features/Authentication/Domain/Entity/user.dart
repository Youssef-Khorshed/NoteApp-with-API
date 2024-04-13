// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntiy extends Equatable {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  UserEntiy({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      id,
      username,
      email,
      firstName,
      lastName,
      gender,
      image,
    ];
  }
}
