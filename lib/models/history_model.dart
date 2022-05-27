import 'package:flutter_application_hackathon_karol/models/food_model.dart';

class HistoryModel {
  int? id;
  String? idUser;
  List<FoodModel>? foods;
  int? quantity;
  String? date;
  int? totalKalori;

  HistoryModel({
    this.id,
    this.foods,
    this.quantity,
    this.totalKalori,
    this.date,
    this.idUser,
  });

  HistoryModel.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    idUser = json['idUser'];
    date = json['date'];
    foods = json['foods']
        .map<FoodModel>((food) => FoodModel.fromJson(id, food))
        .toList();
    quantity = json['quantity'];
    totalKalori = json['totalKalori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foods': foods!.map((food) => food.toJson()).toList(),
      'quantity': quantity,
      'totalKalori': totalKalori,
      'date': date,
      'idUser': idUser,
    };
  }
}
