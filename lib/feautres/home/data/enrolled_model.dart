// 'student_id': '1',
// 'course_code': '1',
// 'enrolled_at': '1'
// make enrolled model and use it in home cubit and home layout
import 'package:cloud_firestore/cloud_firestore.dart';

class EnrolledModel {
  String? student_id;
  String? course_code;
  Timestamp? enrolled_at;
  //enrolled_at;
  String? token;

  EnrolledModel({
    required this.student_id,
    required this.course_code,
    required this.enrolled_at,
    required this.token,
  });
  factory EnrolledModel.fromJson(Map<String, dynamic> json) {
    return EnrolledModel(
      student_id: json['student_id'],
      course_code: json['course_code'],
      enrolled_at: json['enrolled_at'],
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'student_id': student_id,
      'course_code': course_code,
      'enrolled_at': enrolled_at,
      'token': token,
    };
  }
}
