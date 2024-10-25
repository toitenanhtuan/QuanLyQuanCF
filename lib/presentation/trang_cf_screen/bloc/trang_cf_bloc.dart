import 'package:appqlcafe/presentation/trang_cf_screen/models/trang_cf_model.dart';
import 'package:bloc/bloc.dart';

part 'trang_cf_event.dart';
part 'trang_cf_state.dart';
class TrangCfBloc extends Bloc<TrangCfEvent, TrangCfState> {
  TrangCfBloc(TrangCfState initialState) : super(initialState) {
    on<TrangCfInitialEvent>(_onInitialize);
  }

  _onInitialize(
      TrangCfInitialEvent event,
      Emitter<TrangCfState> emit,
      ) async {
    emit(state.copyWith(
        trangCfModelObj: state.trangCfModelObj?.copyWith(
          items: [
            CoffeeItemModel(
              name: "Cappuccino",
              price: "85.000",
              image: "assets/images/cappuccino_small.png",
              rating: "",
              description: "With Oat Milk",
            ),
            CoffeeItemModel(
              name: "Cappuccino",
              price: "76.000",
              image: "assets/images/cappuccino_lowmilk.png",
              rating: "",
              description: "With Lite Milk",
            ),
          ],

        )));
  }
}
