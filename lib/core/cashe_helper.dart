import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../feautres/notification/data/notifiactionModel.dart';
import 'constants/strings.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //  static const String COURSES_KEY = 'courses';
  //
  //   final SharedPreferences _prefs;
  //
  //   CoursePreferences(this._prefs);
  //
  //   List<Course> get courses {
  //     List<String> courseJsonList = _prefs.getStringList(COURSES_KEY);
  //     if (courseJsonList == null) {
  //       return [];
  //     }
  //     return courseJsonList.map((courseJson) => Course.fromJson(json.decode(courseJson))).toList();
  //   }



  static setBool(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
  //save list of notificationModel
  static setNotificationList(
      {required String key, required List<NotificationModel> value}) async {
    return await sharedPreferences.setStringList(key, value.map((e) => e.toJson().toString()).toList());
  }
  //get list of notificationModel
  static List<NotificationModel> getNotificationList({required String key}) {
    List<String>? strings = sharedPreferences.getStringList(key);
    if (strings == null) return [];
    return strings.map((e) => NotificationModel.fromJson(json.decode(e)))
        .toList();
  }
  //clear bool
  static clearBool({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> setBoolRtl(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolRtl({required String key}) {
    return sharedPreferences.getBool(key);
  }
  //set string
  static Future<bool> setString(
      {required String key, required String value})  {
    return  sharedPreferences.setString(key, value);
  }
  //get string future
  static Future<String?> getString2({required String key}) async {
    return await sharedPreferences.getString(key);
  }
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
//clear string
  static Future<bool>  clearString({required String key}) async {
  return await sharedPreferences.remove(key);
}

  static saveToken(String? deviceToken) {
    return sharedPreferences.setString('deviceToken', deviceToken!);
  }

  static Future<String?> getString(String s) async{
    return await sharedPreferences.getString(s);
  }

  static saveData({required String key, required bool value}) async{
    return sharedPreferences.setBool(key, value);
  }
  // CacheHelper.saveNotificationList(
//                   key: "notificationList",
//                   value: state.notifications,
//                 );

 // static Future<bool> saveNotificationList(
 //      {required String key, required List<NotificationModel> value}) async {
 //    return await sharedPreferences.setStringList(key, value.map((e) => e.toJson().toString()).toList());
 //  }
 //  // CacheHelper.getNotificationList(key: "notificationList");
 //  static Future<List<NotificationModel>> getNotificationList2({required String key}) async {
 //    List<String>? strings = sharedPreferences.getStringList(key);
 //    if (strings == null) return [];
 //    return strings.map((e) => NotificationModel.fromJson(json.decode(e)))
 //        .toList();
 //  }
 //  // CacheHelper.clearNotificationList(key: "notificationList");
 //  static Future<bool> clearNotificationList({required String key}) async {
 //    return await sharedPreferences.remove(key);
 //  }

 //  Future<void> storeNotificationsInSharedPreferences(List<Map<String, dynamic>> notifications) async {
 //    List<String> notificationsStringList = [];
 //    notifications.forEach((notification) {
 //      notificationsStringList.add(jsonEncode(notification));
 //    });
 //    await sharedPreferences.setStringList('notifications', notificationsStringList);
 //  } make it static
   static Future<void> storeNotificationsInSharedPreferences(List<Map<String, dynamic>> notifications) async {
    List<String> notificationsStringList = [];
    notifications.forEach((notification) {
      notificationsStringList.add(jsonEncode(notification));
    });
    await sharedPreferences.setStringList('notifications', notificationsStringList);
   }
  static Future<void> getNotificationsFromSharedPreferences() async {
  List<String>? notificationsStringList = sharedPreferences.getStringList('notifications');
    if (notificationsStringList != null) {
      //List<Map<String, dynamic>> notifications = [];
      notificationsStringList.forEach((notificationString) {
        notifications.add(jsonDecode(notificationString));
      });
      // return notifications;
    }

  }




}