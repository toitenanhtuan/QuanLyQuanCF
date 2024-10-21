part of 'cappuccino_one_bloc.dart';

@immutable
class CappuccinoOneState extends Equatable {
  CappuccinoOneState({this.cappuccinoOneModelObj});

  CappuccinoOneModel? cappuccinoOneModelObj;

  @override
  List<Object?> get props => [cappuccinoOneModelObj];
  CappuccinoOneState copyWith({CappuccinoOneModel? cappuccinoOneModelObj}) {
    return CappuccinoOneState(
      cappuccinoOneModelObj: cappuccinoOneModelObj ?? this.cappuccinoOneModelObj,
    );
  }
}

