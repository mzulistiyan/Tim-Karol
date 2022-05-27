import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/services/food_service.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  void fetchFod() async {
    try {
      emit(FoodLoading());

      List<FoodModel> foods = await FoodService().fetchFoods();

      emit(FoodSuccess(foods));
    } catch (e) {
      emit(FoodFailed(e.toString()));
    }
  }
}
