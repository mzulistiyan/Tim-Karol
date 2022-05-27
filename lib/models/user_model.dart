import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String noTelp;
  final String tanggalLahir;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.noTelp,
    required this.tanggalLahir,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, noTelp, tanggalLahir];
}
