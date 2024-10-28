import 'package:appqlcafe/presentation/trang_cf_screen/models/trang_cf_model.dart';
import 'package:equatable/equatable.dart';
import '../models/cart_item.dart';
import 'package:bloc/bloc.dart';

part 'trang_cf_event.dart';
part 'trang_cf_state.dart';

class TrangCfBloc extends Bloc<TrangCfEvent, TrangCfState> {
  TrangCfBloc(TrangCfState initialState) : super(initialState) {
    on<TrangCfInitialEvent>(_onInitialize);
    on<AddToCartEvent>(_onAddToCart);
  }

  _onInitialize(TrangCfInitialEvent event,
      Emitter<TrangCfState> emit,) async {
    emit(state.copyWith(
        trangCfModelObj: state.trangCfModelObj?.copyWith(
          items: [
            CoffeeItemModel(
              name: "Cappuccino With Chocolate",
              price: "85.000",
              image: "assets/images/cappuccino_small.png",
              description: "",
            ),
            CoffeeItemModel(
              name: "Cappuccino With Low Fat Milk",
              price: "76.000",
              image: "assets/images/cappuccino_lowmilk.png",
              description: "",
            ),
          ],

        )));
    on<IncreaseQuantityEvent>((event, emit) {
      final currentCartItems = Map<String, CartItem>.from(state.cartItems);
      final currentProduct = currentCartItems.values.last;
      currentCartItems[currentProduct.name] = CartItem(
        name: currentProduct.name,
        price: currentProduct.price,
        quantity: currentProduct.quantity + 1,
      );

      emit(state.copyWith(
        cartItems: currentCartItems,
        showCart: true,
      ));
    });

    on<DecreaseQuantityEvent>((event, emit) {
      final currentCartItems = Map<String, CartItem>.from(state.cartItems);
      final currentProduct = currentCartItems.values.last;
      if (currentProduct.quantity > 1) {
        currentCartItems[currentProduct.name] = CartItem(
          name: currentProduct.name,
          price: currentProduct.price,
          quantity: currentProduct.quantity - 1,
        );

        emit(state.copyWith(
          cartItems: currentCartItems,
          showCart: true,
        ));
      } else {
        currentCartItems.remove(currentProduct.name);
        emit(state.copyWith(
          cartItems: currentCartItems,
          showCart: currentCartItems.isNotEmpty,
        ));
      }
    });

  }


  void _onAddToCart(AddToCartEvent event, Emitter<TrangCfState> emit) {
    final updatedCart = Map<String, CartItem>.from(state.cartItems);
    if (updatedCart.containsKey(event.name)) {
      updatedCart[event.name]!.quantity++;
    } else {
      updatedCart[event.name] = CartItem(
        name: event.name,
        price: event.price,
        quantity: 1,
      );
    }
    emit(state.copyWith(cartItems: updatedCart, showCart: true));
  }
}


class IncreaseQuantityEvent extends TrangCfEvent {
  @override
  List<Object?> get props => [];
}

class DecreaseQuantityEvent extends TrangCfEvent {
  @override
  List<Object?> get props => [];
}
