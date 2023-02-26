import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
//import bloc consumer
import 'package:flutter_bloc/flutter_bloc.dart';
//import zoom drawer
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../core/constants/my_color.dart';
import '../business_logic/auth_cubit/home_cubit.dart';
import 'Menu.dart';
import 'home_layout.dart';

class ZoomScreen extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<ZoomScreen> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 50;
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return  //ZoomDrawer
    ZoomDrawer(
      angle: -12.0,
      borderRadius: 40.0,
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.orangeAccent,
      menuBackgroundColor: MyColors.menuBackgroundColor,
      isRtl: false,
      menuScreen: MenuScreen(),
      mainScreen: HomeLayoutScreen(),
    );
   },
   );
  }
}
