import 'package:appqlcafe/presentation/trang_cf_screen/models/trang_cf_model.dart';
import 'package:appqlcafe/presentation/trang_cf_screen/models/trangcf_initial_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'trang_cf_event.dart';
part 'trang_cf_state.dart';

class TrangCfBloc extends Bloc<TrangCfEvent, TrangCfState> {
  TrangCfBloc(TrangCfState initialState) : super(initialState) {
    on<TrangCfInitialEvent>(_onInitialize);
  }

  _onInitialize(
      TrangCfInitialEvent event,
      Emitter<TrangCfState> emit,
      ) async {}
}
