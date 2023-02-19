import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:youtube_apis/feautres/home/presenation/widget/home_widgets.dart';
import '../../../../core/constants/strings.dart';
import '../../../core/cashe_helper.dart';
import '../../../core/constants/my_color.dart';
import '../business_logic/auth_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              appBar: AppBar(
                backgroundColor: MyColors.background,
                leading: InkWell(
                onTap: () {
                  print(
                      'dh token mn casheeeeeeeee'
                      );
                  print(
                      CacheHelper.getData(key: 'token')
                      );


              //  AzkarCubit.get(context).getAllRadio();
              //zoom drawer toggle
              ZoomDrawer.of(context)?.toggle();
            },
            child: Icon(
            Icons.list,
            ),
            ),
            title: Text(
            AppStrings.appTitle,
            ),
            elevation: 0,
            ),
              body:Column(
                children: [
                  //container with height 200 and width width of screen *.8 contain asset image
                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                    route: '/morningAzkar',
                  ),
                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                    route: '/eveningAzkar',
                  ),

                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                    route: '/sleepAzkar',
                  ),
                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    isDataExist: false,
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                  ),
                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    isDataExist: false,
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                  ),
                  SizedBox(
                    height: 0.02*MediaQuery.of(context).size.height,
                  ),
                  courseContainer(
                    isDataExist:false,
                    context: context,
                    image: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
                  ),
                  Spacer(),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
