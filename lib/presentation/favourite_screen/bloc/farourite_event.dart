part of 'farourite_bloc.dart';


@immutable
sealed class FarouriteEvent {}

abstract class FavouriteEvent {}

class LoadFavouritesEvent extends FavouriteEvent {}

class ToggleFavouriteEvent extends FavouriteEvent {
  final CoffeeItemModel item;
  ToggleFavouriteEvent(this.item);
}