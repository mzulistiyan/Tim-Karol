import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_hackathon_karol/models/cart_model.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(initialState);
  static get initialState => CartListState();

  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
  }

  addItemToCart(FoodModel food) async {
    emit(CartUpdatingState());
    if (productExist(food)) {
      int index = _carts.indexWhere((element) => element.food!.id == food.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          food: food,
          quantity: 1,
        ),
      );
    }
    emit(CartListState(cart: _carts));
  }

  removeCard(int id) {
    emit(CartUpdatingState());
    _carts.removeAt(id);
    emit(CartListState(cart: _carts));
  }

  clearCard() {
    emit(CartUpdatingState());
    _carts.clear();
    emit(CartListState(cart: _carts));
  }

  addQuantity(int id) {
    emit(CartUpdatingState());
    _carts[id].quantity = _carts[id].quantity! + 1;
    emit(CartListState(cart: _carts));
  }

  reduceQuantity(int id) {
    emit(CartUpdatingState());
    _carts[id].quantity = _carts[id].quantity! - 1;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    emit(CartListState(cart: _carts));
  }

  totalPrice() {
    int total = 0;

    for (var item in _carts) {
      total += (item.quantity! * item.food!.kalori);
    }

    return total;
  }

  productExist(FoodModel food) {
    if (_carts.indexWhere((element) => element.food!.id == food.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
