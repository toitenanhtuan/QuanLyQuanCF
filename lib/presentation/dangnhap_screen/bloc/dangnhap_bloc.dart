import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dangnhap_event.dart';
part 'dangnhap_state.dart';

class DangnhapBloc extends Bloc<DangnhapEvent, DangnhapState> {
  DangnhapBloc() : super(DangnhapInitial()) {
    on<DangnhapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
