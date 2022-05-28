import 'package:flutter_application_hackathon_karol/models/food_model.dart';

class SubscriptionModel {
  int? id;
  String? idUser;
  String? subscriptionTimestamp;

  SubscriptionModel({
    this.id,
    this.subscriptionTimestamp,
    this.idUser,
  });

  SubscriptionModel.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    idUser = json['idUser'];
    subscriptionTimestamp = json['subscriptionTimestamp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subscriptionTimestamp': subscriptionTimestamp,
      'idUser': idUser,
    };
  }
}
