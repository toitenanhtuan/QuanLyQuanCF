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
              name: "Cappuccino With Chocolate",
              price: "85.000",
              image: "assets/images/cappuccino_small.png",
              description: "With Chocolate",
            ),
            CoffeeItemModel(
              name: "Cappuccino With Low Fat Milk",
              price: "76.000",
              image: "assets/images/cappuccino_lowmilk.png",
              description: "With Low Fat Milk",
            ),
          ],

        )));
  }
}
