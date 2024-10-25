
part of 'sinhto_bloc.dart';

class SinhToState {
  final SinhToModel? sinhToModelObj;

  SinhToState({this.sinhToModelObj});

  SinhToState copyWith({SinhToModel? sinhToModelObj}) {
    return SinhToState(
      sinhToModelObj: sinhToModelObj ?? this.sinhToModelObj,
    );
  }
}
