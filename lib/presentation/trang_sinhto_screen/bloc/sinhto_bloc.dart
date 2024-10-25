import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/sinhto_model.dart';

part 'sinhto_event.dart';
part 'sinhto_state.dart';

class SinhToBloc extends Bloc<SinhToEvent, SinhToState> {
  SinhToBloc(SinhToState initialState) : super(initialState) {
    on<SinhToInitialEvent>(_onInitialize);
  }

  _onInitialize(
      SinhToInitialEvent event,
      Emitter<SinhToState> emit,
      ) async {
    emit(state.copyWith(
        sinhToModelObj: state.sinhToModelObj?.copyWith(
          items: [
            SinhToItemModel(
              name: "Sinh tố Bơ",
              price: "40.000",
              image: "assets/images/sinhtobo_small.png",
              rating: "",
            ),
            SinhToItemModel(
              name: "Sinh tố Xoài",
              price: "36.000",
              image: "assets/images/sinhtoxoai_small.png",
              rating: "",
            ),
          ],
        )));
  }
}
