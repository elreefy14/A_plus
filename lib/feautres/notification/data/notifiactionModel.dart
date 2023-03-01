import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  NotificationModel({
    this.student_id,
    this.course_code,
    this.notification,
    this.isRead,
    this.unreadCount,
    this.notificationId,
    this.timestamp,
    this.dateTime
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    student_id = json['student_id'];
    course_code = json['course_code'];
    notification = json['notification'];
    isRead = json['isRead'] ?? false;
    unreadCount = json['unreadCount'] ?? 0;
    notificationId = json['notificationId'] ?? '';
    timestamp = json['timestamp'];
    dateTime = json['dateTime'] != null ? DateTime.fromMillisecondsSinceEpoch(json['dateTime']) : null;
  }

  String? student_id;
  String? course_code;
  String? notification;
  bool? isRead;
  int? unreadCount;
  String? notificationId;
  Timestamp? timestamp;
  DateTime? dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['student_id'] = student_id;
    map['course_code'] = course_code;
    map['notification'] = notification;
    map['isRead'] = isRead;
    map['unreadCount'] = unreadCount;
    map['notificationId'] = notificationId;
    map['timestamp'] = timestamp;
    map['dateTime'] = dateTime?.millisecondsSinceEpoch;
    return map;
  }
}
