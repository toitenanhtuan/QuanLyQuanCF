part of 'getstarted_bloc.dart';

class GetstartedState extends Equatable {
  GetstartedState({this.getstartedModelObj});

  GetstartedModel? getstartedModelObj;

  @override
  // TODO: implement props
  List<Object?> get props => [getstartedModelObj];
  GetstartedState copyWith({GetstartedModel? getstartedModelObj}) {
    return GetstartedState(
      getstartedModelObj: getstartedModelObj ?? this.getstartedModelObj,
    );
  }
}

final class GetstartedInitial extends GetstartedState {}
