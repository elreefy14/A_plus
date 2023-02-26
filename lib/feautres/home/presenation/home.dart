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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    left: 16.w,
                  ),
                  child: Text(
                    'math courses',
                    style: getBoldStyle(
                        fontSize: 18.r, color:
                    MyColors.primaryFontColor
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 12, 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  //network image

                                  'https://tse1.mm.bing.net/th?id=OIP.yRcA-APpL04TDBrGZ3kXlQHaFj&pid=Api&P=0',
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Text(
                                  'Don\'t Make These Hiri...',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  'Y Combinator\n',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  //network image

                                  'https://tse1.mm.bing.net/th?id=OIP.yRcA-APpL04TDBrGZ3kXlQHaFj&pid=Api&P=0',
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Text(
                                  'The science of happi...',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  'How to Be a Better\nHuman',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  //network image
                                  'https://tse1.mm.bing.net/th?id=OIP.yRcA-APpL04TDBrGZ3kXlQHaFj&pid=Api&P=0',
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Text(
                                  '340: Merge: How a Sa...',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  'The SaaS Podcast -\nSaaS, Startups, Growth',
                                  style: getSemiBoldStyle(fontSize: 16.r, color: MyColors.primaryFontColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            );
          },
        );
      }
    );
  }
}
