//
// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:youtube_apis/core/cashe_helper.dart';
// import 'package:youtube_apis/feautres/home/data/course_model.dart';
//
// import '../../../../core/network/web_services.dart';
// import '../../../notification/data/notifiactionModel.dart';
// import '../../data/enrolled_model.dart';
//
// part 'home_state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   static HomeCubit get(context) => BlocProvider.of(context);
//   //COURSES ( course_id , courseName, map of chapter title and isChapterSeen)
//   void addCourse() {
// //fill CourseMode courseModel with data and add it to firebase emit success or error state
//     CourseModel courseModel = CourseModel(
//       course_id: '1',
//       courseName: '1',
//       chapters: [
//         ChapterModel(title: '1', isChapterSeen: false),
//         ChapterModel(title: '1', isChapterSeen: false)
//       ],
//       courseImage: 'https://cdn.discordapp.com/attachments/1008571129012695100/1068578632596988014/IMG-20230127-WA0011.jpg',
//     );
//     FirebaseFirestore.instance.collection('courses')
//         .add(courseModel.toJson())
//         .then((value) {
//       print('course added successfully');
//       emit(addCourseSuccessState());
//     }).catchError((error) {
//       print('Failed to add course:\n\n\n $error');
//       emit(addCourseErrorState());
//     });
//   }
//
//     List<String> courseName = [];
//     void getCourseName() {
//       //get course name from firebase and add it to courseName list print it and use catch error
//       FirebaseFirestore.instance.collection('courses').get().then((value) {
//         value.docs.forEach((element) {
//           courseName.add(element['courseName']);
//         });
//         print(courseName);
//       }).catchError((error) {
//         print('Failed to get course name:\n\n\n $error');
//       });
//     }
//
//     //enrolled (student_id, course_code, quarter, enrolled_at,token) get token from CacheHelper
//
//       //fill EnrolledModel enrolledModel with data and add it to firebase emit success or error state
//        enrollCourse(
//           studentId, courseCode,
//           ) {
//         // try {
//         //   String? token = await CacheHelper.getString('token');
//         //   print('token mn enrolllllll');
//         //   print(token);
//         //   EnrolledModel enrolledModel = EnrolledModel(
//         //     student_id: studentId,
//         //     course_code: courseCode,
//         //     enrolled_at: Timestamp.now(),
//         //     token: token??'',
//         //   );
//         //   await FirebaseFirestore.instance.collection('enrolled')
//         //       .add(enrolledModel.toJson());
//         //   print('enrolled successfully');
//         //   emit(enrollCourseSuccessState());
//         // } catch (error) {
//         //   print('Failed to enroll course:\n\n\n $error');
//         //   emit(enrollCourseErrorState());
//         // }
//         //use then and catch error instead of try catch
//         Future<String?> token = CacheHelper.getString('token').then((value) {
//           print('token mn enrolllllll');
//           print(value);
//           EnrolledModel enrolledModel = EnrolledModel(
//             student_id: studentId,
//             course_code: courseCode,
//             enrolled_at: Timestamp.now(),
//             token: value??'',
//           );
//           FirebaseFirestore.instance.collection('enrolled')
//               .add(enrolledModel.toJson())
//               .then((value) {
//             print('enrolled successfully');
//             emit(enrollCourseSuccessState());
//           }).catchError((error) {
//             print('Failed to enroll course:\n\n\n $error');
//             emit(enrollCourseErrorState());
//           });
//         });
//
//       }
//
// //send notification to student when he enroll in course
//   void sendNotification( messageText, courseCode ,
//   {studentId}
//
//       ) {
//     //print('student id \n\n\n\n');
//       print(FirebaseAuth.instance.currentUser!.uid);
//     //fill NotificationModel notificationModel with data and add it to firebase emit success or error state
//     NotificationModel notificationModel = NotificationModel(
//       student_id: FirebaseAuth.instance.currentUser!.uid,
//       course_code: courseCode,
//       notification: '$messageText',
//       isRead: false,
//      //The argument type 'Timestamp' can't be assigned to the parameter type 'DateTime?'.
//      dateTime: DateTime.now(),
//      timestamp: Timestamp.now(),
//      // date: Timestamp.now(),
//
//     );
//     FirebaseFirestore.instance.collection('users').doc(
//      studentId?? FirebaseAuth.instance.currentUser!.uid
//     )
//     .collection('notification').add(notificationModel.toJson())
//         .then((value) {
//       print('notification sent successfully');
//
//       setNotificationId(FirebaseAuth.instance.currentUser!.uid);
//    //   emit(sendNotificationSuccessState());
//     }).catchError((error) {
//       print('Failed to send notification:\n\n\n $error');
//   //    emit(sendNotificationErrorState());
//     });
//   }
//   //enrolled (student_id, course_code, quarter, year, enrolled_at , token)token is device token
//   //Student (name, id ,token,uId) token is device token
//     //COURSES ( course_id , courseName, lisit of chapter title , isChapterSeen)
//   //get all student id and token enrolled in course from firebase then send notification to them and sendFCMNotification
//   void sendNotificationToAllStudent(messageText, courseCode) {
//     List<String> studentId = [];
//     List<String> studentToken = [];
//     FirebaseFirestore.instance.collection('enrolled').where('course_code',isEqualTo: courseCode).get().then((value) {
//       value.docs.forEach((element) {
//         sendFCMNotification(token: element['token'],messageText: messageText);
//         sendNotification(
//             messageText,
//              courseCode,
//             studentId: element['student_id']
//         );
//
//        // studentId.add(element['student_id']);
//        // studentToken.add(element['token']);
//       });
//       print(studentId);
//       print(studentToken);
//
//     }).catchError((error) {
//       print('Failed to get student id and token:\n\n\n $error');
//     });
//   }
//
//
//   //get notification for student from firebase and notification where isRead is false and add it to unReadNotificationList list print it and use catch error use pagination to get notification and loadMoreNotifications and resetNotificationList
//   List<NotificationModel> notificationList = [];
//   List<NotificationModel> unReadNotificationList = [];
//   void getNotification(student_id) {
//     //get from list of notification from firebase and add it to notificationList list print it and use catch error
//     FirebaseFirestore.instance.collection('users').doc(student_id)
//         .collection('notification').orderBy('timestamp',descending: true).limit(6).get().then((value) {
//       value.docs.forEach((element) {
//         notificationList.add(NotificationModel.fromJson(element.data()));
//         if (element['isRead'] == false) {
//           unReadNotificationList.add(NotificationModel.fromJson(element.data()));
//         }
//       });
//       print(notificationList);
//       print(unReadNotificationList);
//     }).catchError((error) {
//       print('Failed to get notification:\n\n\n $error');
//     });
//   }
//   void nextNotifications()
//   {
//     FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('notification').orderBy('timestamp',descending: true).limit(6).startAfter([notificationList[notificationList.length-1].timestamp]).get().then((value) {
//       value.docs.forEach((element) {
//         notificationList.add(NotificationModel.fromJson(element.data()));
//         if (element['isRead'] == false) {
//           unReadNotificationList.add(NotificationModel.fromJson(element.data()));
//         }
//       });
//       print(notificationList);
//       print(unReadNotificationList);
//     }).catchError((error) {
//       print('Failed to get notification:\n\n\n $error');
//     });
//   }
//   void previousNotifications()
//   {
//     FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('notification').orderBy('timestamp',descending: true).limit(6).endBefore([notificationList[0].timestamp]).get().then((value) {
//       value.docs.forEach((element) {
//         notificationList.add(NotificationModel.fromJson(element.data()));
//         if (element['isRead'] == false) {
//           unReadNotificationList.add(NotificationModel.fromJson(element.data()));
//         }
//       });
//       print(notificationList);
//       print(unReadNotificationList);
//     }).catchError((error) {
//       print('Failed to get notification:\n\n\n $error');
//     });
//   }
//   void resetNotificationList()
//   {
//     notificationList = [];
//     unReadNotificationList = [];
//   }
// //for every notificatin set notificationId equal to document id
//   void setNotificationId(student_id) {
//     FirebaseFirestore.instance.collection('users').doc(student_id)
//         .collection('notification').get().then((value) {
//       value.docs.forEach((element) {
//         FirebaseFirestore.instance.collection('users').doc(student_id)
//             .collection('notification').doc(element.id).update({
//           'notificationId': element.id,
//         });
//       });
//     }).catchError((error) {
//       print('Failed to set notification id:\n\n\n $error');
//     });
//   }
//   //get number of unread notification for student from firebase and print it
//   int unreadNotification = 0;
//   void getUnreadNotification(student_id) {
//     //get from list of notification from firebase and add it to notificationList list print it and use catch error
//     FirebaseFirestore.instance.collection('users').doc(student_id)
//         .collection('notification').get().then((value) {
//       value.docs.forEach((element) {
//         if (element['isRead'] == false) {
//           unreadNotification++;
//         }
//       });
//       print(unreadNotification);
//     }).catchError((error) {
//       print('Failed to get unread notification:\n\n\n $error');
//     });
//   }
//   //set notification to read
//   void setNotificationToRead(student_id, notificationId) {
//     FirebaseFirestore.instance.collection('users').doc(student_id)
//         .collection('notification').doc(notificationId).update({
//       'isRead': true,
//     }).then((value) {
//       print('notification set to read successfully');
//     }).catchError((error) {
//       print('Failed to set notification to read:\n\n\n $error');
//     });
//   }
//   //send fcm notification to student then sendNotification()
//   Future<void> sendFCMNotification({
//     required String? token,
//      String? senderName ='A plus',
//     String? messageText,
//     String? messageImage,
//   }) async {
//     DioHelper.postData(
//         data: {
//           "to": "$token",
//           "notification": {
//             "title": "$senderName",
//             "body":
//             "${messageText != null ? messageText : messageImage != null ? 'Photo' : 'ERROR 404'}",
//             "sound": "default"
//           },
//           "android": {
//             "Priority": "HIGH",
//           },
//           "data": {
//             "type": "order",
//             "id": "87",
//             "click_action": "FLUTTER_NOTIFICATION_CLICK"
//           }
//         }
//     );
//     emit(SendMessageSuccessState());
//   }
//
//
//   //get fcmtoken for student from firebase and print it
//   firebaseMessagingGetTokenForEachDevice()
//   {
//     FirebaseMessaging.instance.getToken().then((value) {
//       print('FCM Token: $value');
//     }).catchError((error) {
//       print('Failed to get FCM Token:\n\n\n $error');
//     });
//   }
//   //get fcmtoken for student from firebase and print it
//   Future firebaseMessagingGetToken() async {
//     try {
//       String? value = await FirebaseMessaging.instance.getToken();
//       print('FCM Token:\n\n\n $value \n\n\n\n');
//
//       //save token in cache for current user
//       await CacheHelper.setString(key: 'token', value: value ?? '');
//
//       //save token in firebase for current user
//       await FirebaseFirestore.instance.collection('users').doc(
//           FirebaseAuth.instance.currentUser!.uid
//       ).update({
//         'token': value,
//       });
//       print(' token dh mn firebase:\n\n\n');
//       print(FirebaseAuth.instance.currentUser!.refreshToken);
//       print('token saved successfully');
//     } catch (error) {
//       print('Failed to get or save FCM token:\n\n\n $error');
//     }
//   }
//
//
//
//
//
//
//
// }
