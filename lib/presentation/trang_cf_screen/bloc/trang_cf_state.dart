part of 'trang_cf_bloc.dart';

class TrangCfState {
  final TrangCfModel? trangCfModelObj;

  TrangCfState({this.trangCfModelObj});

  TrangCfState copyWith({TrangCfModel? trangCfModelObj}) {
    return TrangCfState(
      trangCfModelObj: trangCfModelObj ?? this.trangCfModelObj,
    );
  }
}

final class TrangCfInitial extends TrangCfState {}
