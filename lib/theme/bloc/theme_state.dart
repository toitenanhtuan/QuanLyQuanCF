part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  ThemeState({required this.themeType});

  final String themeType;

  @override
  // TODO: implement props
  List<Object?> get props => [themeType];
  ThemeState copyWith({String? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }
}
