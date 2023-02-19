import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/cashe_helper.dart';
import '../../../core/network/web_services.dart';
import '../data/notifiactionModel.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);
//sendFcmNotification
  void sendFCMNotification({
    required String? token,
    required String? senderName,
    String? messageText,
    String? messageImage,
  }) {
    DioHelper.postData(
        data: {
          "to": "$token",
          "notification": {
            "title": "$senderName",
            "body":
            "${messageText != null ? messageText : messageImage != null ? 'Photo' : 'ERROR 404'}",
            "sound": "default"
          },
          "android": {
            "Priority": "HIGH",
          },
          "data": {
            "type": "order",
            "id": "87",
            "click_action": "FLUTTER_NOTIFICATION_CLICK"
          }
        }
    );
    emit(SendMessageSuccessState());
  }
  // Use caching: Store the list of notificationList in memory, and only retrieve the data from Firebase when it is not available in the cache. This way, you can reduce the number of reads from Firebase, especially if the same notificationList is frequently accessed. how to do that


//for every notificatin set notificationId equal to document id
  void setNotificationId(student_id) {
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('users').doc(student_id)
            .collection('notification').doc(element.id).update({
          'notificationId': element.id,
        });
      });
    }).catchError((error) {
      print('Failed to set notification id:\n\n\n $error');
    });
  }
  //get number of unread notification for student from firebase and print it
  int unreadNotification = 0;
  void getUnreadNotification(student_id) {
    //get from list of notification from firebase and add it to notificationList list print it and use catch error
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').get().then((value) {
      value.docs.forEach((element) {
        if (element['isRead'] == false) {
          unreadNotification++;
        }
      });
      print(unreadNotification);
    }).catchError((error) {
      print('Failed to get unread notification:\n\n\n $error');
    });
  }
//Use caching: Store the list of chapters for each course in memory, and only retrieve the data from Firebase when it is not available in the cache. This way, you can reduce the number of reads from Firebase, especially if the same course is frequently accessed.
//get notification for student from firebase and use catch error use shared pref to save notification list and get it from shared pref and only retrieve the data from Firebase when it is not available in the cache
  List<NotificationModel> notificationList = [];
  List<NotificationModel> unReadNotificationList = [];
  void getNotification(student_id) {
    //get from list of notification from firebase and add it to notificationList list print it and use catch error
    FirebaseFirestore.instance.collection('users').doc(student_id)
        .collection('notification').orderBy('timestamp',descending: true).limit(6).get().then((value) {
      value.docs.forEach((element) {
        notificationList.add(NotificationModel.fromJson(element.data()));
        if (element['isRead'] == false) {
          unReadNotificationList.add(NotificationModel.fromJson(element.data()));
        }
      });
      print(notificationList);
      print(unReadNotificationList);
      emit(LoadMoreNotificationsSuccessState(
          notificationList,
      ));
    }).catchError((error) {
      print('Failed to get notification:\n\n\n $error');
    });

  }
  void loadMoreNotifications()
  {

    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notification').orderBy('timestamp',descending: true).limit(6).startAfter([notificationList[notificationList.length-1].timestamp]).get().then((value) {
      value.docs.forEach((element) {
        notificationList.add(NotificationModel.fromJson(element.data()));
        if (element['isRead'] == false) {
          unReadNotificationList.add(NotificationModel.fromJson(element.data()));
        }
      });
      print(notificationList);
      print(unReadNotificationList);
      emit(LoadMoreNotificationsSuccessState(
          notificationList,
      ));
    }).catchError((error) {
      print('Failed to get notification:\n\n\n $error');
      emit(LoadMoreNotificationsErrorState(error.toString()));
    });
  }

}
