import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_hackathon_karol/models/history_model.dart';
import 'package:flutter_application_hackathon_karol/services/transaction_service.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  void fetchHistoryHitung() async {
    try {
      emit(HistoryLoading());

      List<HistoryModel> historys =
          await TransactionService().fetchHistoryHitung();

      emit(HistorySuccess(historys));
    } catch (e) {
      emit(HistoryFailed(e.toString()));
    }
  }
}
