import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_hackathon_karol/models/cart_model.dart';
import 'package:flutter_application_hackathon_karol/models/history_model.dart';
import 'package:flutter_application_hackathon_karol/models/transaction_model.dart';
import 'package:flutter_application_hackathon_karol/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(List<CartModel> transaction, int total, String date,
      String idUser, int fixKaloriCustom) async {
    try {
      emit(TransactionLoading());
      await TransactionService()
          .createTransaction(transaction, total, date, idUser, fixKaloriCustom);
      emit(TransactionSuccess(const []));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
