import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
//import MenuScreen drawer
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/font_manager.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/constants/styles_manager.dart';




//make class MenuItem
class MenuItem {
  final String title;
  final IconData icon;
  const MenuItem(this.title, this.icon);
}
class MenuItems {
  static const payment = const MenuItem('الدفع', Icons.payment);
  //notifications , help , aboutUs , rateUs
  static const notifications = const MenuItem('الاشعارات', Icons.notifications);
  static const help = const MenuItem('المساعدة', Icons.help);
  static const aboutUs = const MenuItem('عن التطبيق', Icons.info);
  static const rateUs = const MenuItem('قيم التطبيق', Icons.star);
  static List<MenuItem> menuItems = <MenuItem>[
    MenuItems.payment,
    MenuItems.notifications,
    MenuItems.help,
    MenuItems.aboutUs,
    MenuItems.rateUs,
  ];
}
class MenuScreen extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<MenuScreen> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
 //  bool isPlaying=QuraanCubit.get(context).isPlaying;
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.menuBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Spacer(flex: 1,),
           ...MenuItems.menuItems.map((e) => InkWell(
              onTap: () {
                switch (e.title) {
                  case 'الدفع':
                    // Navigator.pushNamed(context, '/payment');
                    break;
                  case 'الاشعارات':
                    // Navigator.pushNamed(context, '/notifications');
                    break;
                  case 'المساعدة':
                    // Navigator.pushNamed(context, '/help');
                    break;
                  case 'عن التطبيق':
                    // Navigator.pushNamed(context, '/aboutUs');
                    break;
                  case 'قيم التطبيق':
                    // Navigator.pushNamed(context, '/rateUs');
                    break;
                }
              },
              child: Container(
                height: h * .08,
                width: w * .9,
                decoration: BoxDecoration(
                  color: MyColors.menuBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: w * .05,),
                    Icon(e.icon),
                    SizedBox(width: w * .05,),
                    Text(
                      e.title,
                      style:getMediumStyle(fontSize: 18.r, color: Colors.black)
                      ),

                  ],
                ),
              ),
            ),).toList(),
            Spacer(flex: 2,),

          ],
        ),
      ),
    );
  }
}

