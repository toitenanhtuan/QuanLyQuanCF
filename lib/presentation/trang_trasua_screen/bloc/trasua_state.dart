part of 'trasua_bloc.dart';

class TraSuaState {
  final TraSuaModel? traSuaModelObj;

  TraSuaState({this.traSuaModelObj});

  TraSuaState copyWith({TraSuaModel? traSuaModelObj}) {
    return TraSuaState(
      traSuaModelObj: traSuaModelObj ?? this.traSuaModelObj,
    );
  }
}
