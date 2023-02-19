import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:intl/intl.dart';
import 'package:youtube_apis/core/cashe_helper.dart';
import '../../../core/constants/my_color.dart';
import '../business_logic/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
     //     NotificationCubit.get(context).getNotification(
     //       FirebaseAuth.instance.currentUser!.uid,
     //     );
          return BlocConsumer<NotificationCubit, NotificationState>(
            listener: (context, state) {
     //         if (state is LoadMoreNotificationsSuccessState) {
     //           CacheHelper.saveNotificationList(
     //             key: "notificationList",
     //             value: state.notificationList,
     //           );
     //         }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  // row icon to go back
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: MyColors.defaultColor,
                  // Text("Notifications") in the end of the app bar,
                  title: Text("Notifications"),
                ),
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return _buildTabletLayout(
                        context,
                      );
                    } else {
                      return Padding(
                        padding:  EdgeInsets.only(top: 16.h),
                        child: _buildMobileLayout(context),
                      );
                    }
                  },
                ),
              );
            },
          );
        }
    );
  }
}
Widget _buildMobileLayout(context) {
  return Container(
    child: BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {

        return FirestoreListView(
          cacheExtent: 20,
          pageSize: 2,
          query:
          FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('notification'),
          itemBuilder: (context, QueryDocumentSnapshot) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 4.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: MyColors.defaultColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        (QueryDocumentSnapshot.data() as Map)["notification"] ?? 'ahemd',
                        style:
                        TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                     // (QueryDocumentSnapshot.data() as Map)["timestamp"] != null
                      //    ? DateFormat.yMMMd().format(
                     //   (QueryDocumentSnapshot.data() as Map)["timestamp"],
                     // )
                    //       :
                    '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );

      },
    ),
  );
}






Widget _buildTabletLayout(context,) {
  return Container(
    child: BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return FirestoreListView(
          cacheExtent: 20,
          pageSize: 2,
          query:
          FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('notification'),
          itemBuilder: (context, QueryDocumentSnapshot) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 4.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: MyColors.defaultColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        (QueryDocumentSnapshot.data() as Map)["notification"] ?? 'ahemd',
                        style:
                        TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      // (QueryDocumentSnapshot.data() as Map)["timestamp"] != null
                      //    ? DateFormat.yMMMd().format(
                      //   (QueryDocumentSnapshot.data() as Map)["timestamp"],
                      // )
                      //       :
                      '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  );

}