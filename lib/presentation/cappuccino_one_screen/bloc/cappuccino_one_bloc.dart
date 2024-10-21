import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/cappuccino_one_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cappuccino_one_state.dart';
part 'cappuccino_one_event.dart';

class CappuccinoOneBloc extends Bloc<CappuccinoOneEvent, CappuccinoOneState> {
  CappuccinoOneBloc(CappuccinoOneState initialState) : super(initialState) {
    on<CappuccinoOneInitialEvent>(_onInitialize);
    // TODO: implement event handler
  }

  _onInitialize(
      CappuccinoOneInitialEvent event,
      Emitter<CappuccinoOneState> emit,
      ) async {}
}
