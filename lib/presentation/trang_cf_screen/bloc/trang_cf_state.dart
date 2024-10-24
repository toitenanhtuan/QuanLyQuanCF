part of 'trang_cf_bloc.dart';

class TrangCfState extends Equatable {
  TrangCfState({
    this.trangCfModelObj,
    this.trangCfInitialModelObj});

  TrangCfModel? trangCfModelObj;
  TrangCfInitialModel? trangCfInitialModelObj;

  @override
  // TODO: implement props
  List<Object?> get props => [trangCfInitialModelObj, trangCfModelObj];
  TrangCfState copyWith({
    TrangCfInitialModel? trangCfInitialModelObj,
    TrangCfModel?  trangCfModelObj,
  }) {
    return TrangCfState(
      trangCfInitialModelObj:
        trangCfInitialModelObj ?? this.trangCfInitialModelObj,
      trangCfModelObj: trangCfModelObj ?? this.trangCfModelObj,
    );
  }
}

final class TrangCfInitial extends TrangCfState {}
