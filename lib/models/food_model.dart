import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String id;
  final String name;
  int kalori;
  final String imageUrl;

  FoodModel({
    this.id = '',
    this.name = '',
    this.kalori = 0,
    this.imageUrl = '',
  });

  factory FoodModel.fromJson(String id, Map<String, dynamic> json) => FoodModel(
        id: id,
        name: json['name'],
        kalori: json['kalori'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'kalori': kalori,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        kalori,
        imageUrl,
      ];
}
