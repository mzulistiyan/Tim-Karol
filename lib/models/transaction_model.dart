import 'package:flutter_application_hackathon_karol/models/food_model.dart';

class TransactionModel {
  final String id;
  final FoodModel food;
  final int quantity;
  final String idUser;
  final int totalKalori;

  TransactionModel({
    this.id = '',
    required this.food,
    this.quantity = 0,
    this.totalKalori = 0,
    this.idUser = '',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          id: id,
          food: FoodModel.fromJson(id, json['food']),
          quantity: json['quantity'],
          totalKalori: json['totalKalori'],
          idUser: json['idUser']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food': food.toJson(),
      'quantity': quantity,
      'totalKalori': totalKalori,
      'idUser': idUser,
    };
  }

  int getTotalPrice() {
    return food.kalori * quantity;
  }
}
