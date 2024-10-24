import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/trang_cf_bloc.dart';
import 'models/trangcf_initial_model.dart';

class TrangCfInitialPage extends StatefulWidget {
  const TrangCfInitialPage({Key? key}) : super (key: key,);

  @override
  State<StatefulWidget> createState() => TrangCfInitialPageState();
    // TODO: implement createState
  static Widget builder(BuildContext context) {
    return BlocProvider<TrangCfBloc>(
      create: (context) => TrangCfBloc(TrangCfState(
        trangCfInitialModelObj: TrangCfInitialModel(),
      ))
        ..add(TrangCfInitialEvent()),
      child: TrangCfInitialPage(),
    );
  }
}

class TrangCfInitialPageState extends State<TrangCfInitialPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled){
        return [
          SliverToBoxAdapter(
            child: Container(),
          )
        ];
      },
      body: Container(),
    );
  }
}