part of 'trang_cf_bloc.dart';

class TrangCfState {
  final TrangCfModel? trangCfModelObj;
  final Map<String, CartItem> cartItems;
  final bool showCart;

  TrangCfState({
    this.trangCfModelObj,
    Map<String, CartItem>? cartItems,
    this.showCart = false,}) : cartItems = cartItems ?? {};

  TrangCfState copyWith({
    TrangCfModel? trangCfModelObj,
    Map<String, CartItem>? cartItems,
    bool? showCart,
  }) {
    return TrangCfState(
      trangCfModelObj: trangCfModelObj ?? this.trangCfModelObj,
      cartItems: cartItems ?? this.cartItems,
      showCart: showCart ?? this.showCart,
    );
  }
}

final class TrangCfInitial extends TrangCfState {}
