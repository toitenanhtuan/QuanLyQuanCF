import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../trang_cf_screen/models/trang_cf_model.dart';

part 'farourite_event.dart';
part 'farourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState()) {
    on<LoadFavouritesEvent>(_onLoadFavourites);
    on<ToggleFavouriteEvent>(_onToggleFavourite);
  }

  void _onLoadFavourites(LoadFavouritesEvent event, Emitter<FavouriteState> emit) {
    // Here you would typically load favourites from local storage
    emit(state);
  }

  void _onToggleFavourite(ToggleFavouriteEvent event, Emitter<FavouriteState> emit) {
    final currentFavourites = List<CoffeeItemModel>.from(state.favouriteItems);

    final index = currentFavourites.indexWhere((item) => item.name == event.item.name);
    if (index >= 0) {
      currentFavourites.removeAt(index);
    } else {
      currentFavourites.add(event.item);
    }

    emit(state.copyWith(favouriteItems: currentFavourites));
  }
}
