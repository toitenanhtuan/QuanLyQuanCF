import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/app_navigation_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc(AppNavigationState initialState) : super(initialState) {
    on<AppNavigationInitialEvent>(_onInitialize);
      // TODO: implement event handler
  }

  _onInitialize(
      AppNavigationInitialEvent event,
      Emitter<AppNavigationState> emit,
      ) async {}
}
