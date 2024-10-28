part of 'trang_cf_bloc.dart';

abstract class TrangCfEvent {}

class TrangCfInitialEvent extends TrangCfEvent {}

class AddToCartEvent extends TrangCfEvent {
  final String name;
  final double price;

  AddToCartEvent({required this.name, required this.price});
}

