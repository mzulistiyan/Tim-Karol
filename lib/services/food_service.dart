import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';

class FoodService {
  final CollectionReference _foodReference =
      FirebaseFirestore.instance.collection('food');

  Future<List<FoodModel>> fetchFoods() async {
    try {
      QuerySnapshot result = await _foodReference.get();
      List<FoodModel> foods = result.docs.map((e) {
        return FoodModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      print(foods);
      return foods;
    } catch (e) {
      throw e;
    }
  }
}
