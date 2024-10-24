import 'package:appqlcafe/presentation/getstarted_screen/bloc/getstarted_bloc.dart';
import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/cappuccino_one_screen/cappuccino_one_screen.dart';
import '../presentation/dangnhap_screen/dangnhap_screen.dart';
import '../presentation/getstarted_screen/getstarted_screen.dart';
import '../presentation/trang_cf_screen/trang_cf_screen.dart';
// import '../presentation/';
// import '../presentation/';
// import '../presentation/';
// import '../presentation/';
// import '../presentation/';
// import '../presentation/';
// import '../presentation/';

class AppRoutes {
  static const String getstartedScreen = '../lib/presentation/getstarted_screen/getstarted_screen.dart';
  static const String dangnhapScreen = '/dangnhap_screen';
  static const String cappuccinoOneScreen = '/cappuccino_one_screen';
  static const String giohangOneScreen = '/giohang_one_screen';
  static const String trangCfScreen = '/trang_cf_screen';
  static const String trangCfInitialPage = '/trang_cf_initial_page';
  static const String themgiohangScreen = '/themgiohang_screen';
  static const String thanhtoanScreen = '/thanhtoan_screen';
  static const String trasuaPage = '/trasua_page';
  static const String motatrasuaScreen = '/motatrasua_screen';
  static const String motatrasuaTabPage = '/motatrasua_tabpage';
  static const String tsgiohangScreen = '/tsgiohang_screen';
  static const String sinhtoPage = '/sinhto_page';
  static const String motasinhtoScreen = '/motasinhto_screen';
  static const String motasinhtoTabPage = '/motasinhto_tabpage';
  static const String stgiohangScreen = '/stgiohang_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    getstartedScreen: GetstartedScreen.builder,
    dangnhapScreen: DangnhapScreen.builder,
    // cappuccinoOneScreen: CappuccinoOneScreen.builder,
    // giohangOneScreen: GiohangOneScreen.builder,
    trangCfScreen: TrangCfScreen.builder,
    // themgiohangScreen: ThemgiohangScreen.builder,
    // thanhtoanScreen: ThanhtoanScreen.builder,
    // motatrasuaScreen: MotatrasuaScreen.builder,
    // tsgiohangScreen: TsgiohangScreen.builder,
    // motasinhtoScreen: MotasinhtoScreen.builder,
    // stgiohangScreen: StgiohangScreen.builder,
    // appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: GetstartedScreen.builder
  };
}