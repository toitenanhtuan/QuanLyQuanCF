import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/dangnhap_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dangnhap_event.dart';
part 'dangnhap_state.dart';

class DangnhapBloc extends Bloc<DangnhapEvent, DangnhapState> {
  DangnhapBloc(DangnhapState initialState) : super(initialState) {
    on<DangnhapInitialEvent>(_onInitialize);
      // TODO: implement event handler
    }

  _onInitialize(
      DangnhapInitialEvent event,
      Emitter<DangnhapState> emit,
      ) async {
    emit(
      state.copyWith(
        emailtwoController: TextEditingController(),
        nhapmatkhauoneController: TextEditingController(),
      ),
    );
  }
}
