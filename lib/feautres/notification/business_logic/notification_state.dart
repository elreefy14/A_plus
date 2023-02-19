part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
//sendNotificationSuccessState
class sendNotificationSuccessState extends NotificationState {}
//sendNotificationErrorState
class sendNotificationErrorState extends NotificationState {
  final String error;
  sendNotificationErrorState(this.error);
}
//SendMessageSuccessState
class SendMessageSuccessState extends NotificationState {}
//LoadMoreNotificationsSuccessState
class LoadMoreNotificationsSuccessState extends NotificationState {
  final List<NotificationModel> notificationList;
  LoadMoreNotificationsSuccessState(this.notificationList);
}
//LoadMoreNotificationsErrorState
class LoadMoreNotificationsErrorState extends NotificationState {
  final String error;
  LoadMoreNotificationsErrorState(this.error);
}


