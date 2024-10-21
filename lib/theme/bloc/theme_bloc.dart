import 'package:flutter/material.dart';
import 'package:appqlcafe/core/app_export.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState) {
    on<ThemeChangeEvent>(_changeTheme);
  }

  _changeTheme(
      ThemeChangeEvent event,
      Emitter<ThemeState> emit,
      ) async {
    emit(state.copyWith(themeType: event.themeType));
  }
}