part of 'dangnhap_bloc.dart';

class DangnhapState extends Equatable {
  DangnhapState({
    this.emailtwoController,
    this.nhapmatkhauoneController,
    this.dangnhapModelObj
});
  TextEditingController? emailtwoController;
  TextEditingController? nhapmatkhauoneController;

  DangnhapModel? dangnhapModelObj;

  @override
  // TODO: implement props
  List<Object?> get props => [emailtwoController, nhapmatkhauoneController, dangnhapModelObj];
  DangnhapState copyWith({
    TextEditingController? emailtwoController,
    TextEditingController? nhapmatkhauoneController,
    DangnhapModel? dangnhapModelObj,
}) {
    return DangnhapState(
      emailtwoController: emailtwoController ?? this.emailtwoController,
      nhapmatkhauoneController: nhapmatkhauoneController ?? this.nhapmatkhauoneController,
      dangnhapModelObj: dangnhapModelObj ?? this.dangnhapModelObj,
    );
  }
}

final class DangnhapInitial extends DangnhapState {}
