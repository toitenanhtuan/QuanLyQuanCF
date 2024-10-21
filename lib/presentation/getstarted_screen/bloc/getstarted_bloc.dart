import 'package:appqlcafe/presentation/getstarted_screen/models/getstarted_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'getstarted_event.dart';
part 'getstarted_state.dart';

class GetstartedBloc extends Bloc<GetstartedEvent, GetstartedState> {
  GetstartedBloc(GetstartedState initialState) : super(initialState) {
    on<GetstartedInitialEvent>(_onInitialize);
  }

  _onInitialize(
  GetstartedInitialEvent event,
  Emitter<GetstartedState> emit,
  ) async {}
}
