part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodSuccess extends FoodState {
  final List<FoodModel> foods;

  FoodSuccess(this.foods);

  @override
  List<Object> get props => [foods];
}

class FoodFailed extends FoodState {
  final String error;

  FoodFailed(this.error);

  @override
  List<Object> get props => [error];
}
