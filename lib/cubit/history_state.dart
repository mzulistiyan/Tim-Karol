part of 'history_cubit.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<HistoryModel> historys;
  HistorySuccess(this.historys);
  @override
  // TODO: implement props
  List<Object> get props => [historys];
}

class HistoryFailed extends HistoryState {
  final String error;

  HistoryFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
