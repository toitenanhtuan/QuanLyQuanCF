part of 'farourite_bloc.dart';

@immutable
class FavouriteState {
  final List<CoffeeItemModel> favouriteItems;

  FavouriteState({this.favouriteItems = const []});

  FavouriteState copyWith({List<CoffeeItemModel>? favouriteItems}) {
    return FavouriteState(
      favouriteItems: favouriteItems ?? this.favouriteItems,
    );
  }
}

