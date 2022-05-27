part of 'cart_cubit.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];

  get cart => null;
}

class CartListState extends CartState {
  final List<CartModel> cart;
  CartListState({this.cart = const []});
  @override
  List<Object?> get props => [cart];
}

class CartUpdatingState extends CartState {}
