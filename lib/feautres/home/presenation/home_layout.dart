import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_apis/feautres/home/presenation/widget/bottomNavBar.dart';
import 'package:youtube_apis/feautres/home/presenation/widget/home_widgets.dart';
import '../../../../core/constants/strings.dart';
import '../../../core/cashe_helper.dart';
import '../../../core/constants/my_color.dart';
import '../../../core/constants/styles_manager.dart';
import '../business_logic/auth_cubit/home_cubit.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
    //    HomeCubit.get(context).firebaseMessagingGetToken(
     //   );
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            Size size = MediaQuery.of(context).size;
            double height = 50;

            return Scaffold(
              bottomNavigationBar:BottomNavBar(
                context: context,
                icons: [
                  Icons.home,
                  Icons.search,
                  Icons.favorite,
                  Icons.person,
                ],
                //use Home cubit to change index
                onTap: (index) {
                  HomeCubit.get(context).changeIndex(index);
                  //Navigator.pushNamed(context,  HomeCubit.get(context).listOfRoutes[index]);
                },
                // onTap: (index) => setState(() => currentIndex = index),
                currentIndex: HomeCubit.get(context).currentIndex,
                backgroundColor: Colors.white,
                iconColor: Colors.grey,
                activeIconColor: MyColors.mainColor,
              ),
              appBar: AppBar(
                backgroundColor: MyColors.mainColor,
                leading: InkWell(
                onTap: () {

              ZoomDrawer.of(context)?.toggle();
            },
            child: Icon(
            Icons.list,
              color: Colors.white,
            ),
            ),
            title: Text(
            AppStrings.appTitle,
              style: getBoldStyle(
              fontSize: 24.r,
              color: MyColors.secondaryFontColor,
            ),
            ),
            elevation: 0,
            ),

              body: HomeCubit.get(context).listOfScreens[HomeCubit.get(context).currentIndex],

            );
          },
        );
      }
    );
  }
}
