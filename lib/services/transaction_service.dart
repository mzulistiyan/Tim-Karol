// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_hackathon_karol/models/cart_model.dart';
import 'package:flutter_application_hackathon_karol/models/history_model.dart';
import 'package:flutter_application_hackathon_karol/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(List<CartModel> transaction, int totalKalori,
      String date, String idUser, int fixKaloriCustom) async {
    try {
      _transactionReference.add({
        'foods': transaction
            .map((e) => {
                  'id': e.food!.id,
                  'kalori':
                      fixKaloriCustom == 0 ? e.food!.kalori : fixKaloriCustom,
                  'name': e.food!.name,
                  'imageUrl': e.food!.imageUrl,
                })
            .toList(),
        'totalKalori': totalKalori + fixKaloriCustom,
        'date': date == '' ? DateFormat("d/MM/y").format(DateTime.now()) : date,
        'idUser': idUser,
      });
    } catch (e) {
      rethrow;
    }
  }

  //NOTE OLD VERSION
  Future<List<HistoryModel>> fetchHistoryHitung() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection('transactions').get();

      List<HistoryModel> transaction = result.docs.map((e) {
        return HistoryModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      print(transaction);
      return transaction;
    } catch (e) {
      print('Error');

      print(e.toString());
      rethrow;
    }
  }
}
