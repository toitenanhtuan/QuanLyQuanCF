import '../models/trasua_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trasua_event.dart';
part 'trasua_state.dart';


class TraSuaBloc extends Bloc<TraSuaEvent, TraSuaState> {
  TraSuaBloc(TraSuaState initialState) : super(initialState) {
    on<TraSuaInitialEvent>(_onInitialize);
  }

  _onInitialize(
      TraSuaInitialEvent event,
      Emitter<TraSuaState> emit,
      ) async {
    emit(state.copyWith(
        traSuaModelObj: state.traSuaModelObj?.copyWith(
          items: [
            TraSuaItemModel(
              name: "Trà sữa nướng",
              price: "50.000",
              image: "assets/tra_sua_nuong.jpg",
              rating: "4.5",
            ),
            TraSuaItemModel(
              name: "Trà sữa thái xanh",
              price: "56.000",
              image: "assets/tra_sua_thai_xanh.jpg",
              rating: "4.7",
            ),
          ],
        )));
  }
}