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
import '../../../../../core/constants/strings.dart';
import '../../../../core/cashe_helper.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/constants/styles_manager.dart';
import '../business_logic/auth_cubit/home_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<SearchScreen> {
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

            return Column(
              children: [
                Text('Search Screen'),
              ],
            );
          },
        );
      }
    );
  }
}
