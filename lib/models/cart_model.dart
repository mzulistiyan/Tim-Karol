import 'package:flutter_application_hackathon_karol/models/food_model.dart';

class CartModel {
  int? id;
  FoodModel? food;
  int? quantity;
  int? fixKalori;

  CartModel({this.id, this.food, this.quantity, this.fixKalori});

  CartModel.fromJson(String id, Map<String, dynamic> json) {
    id = json['id'];
    food = FoodModel.fromJson(id, json['food']);
    quantity = json['quantity'];
    fixKalori = json['fixKalori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food': food!.toJson(),
      'quantity': quantity,
      'fixKalori': fixKalori,
    };
  }

  int getTotalPrice() {
    return food!.kalori * quantity!;
  }
}
