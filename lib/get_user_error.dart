// //GetUserErrorModel using json_serializable for this json
// // {
// // "message": "Resource not found"
// // }
// //
// //Compare this snippet from lib/get_user_error_model.dart:
// import 'package:json_annotation/json_annotation.dart';
//
// part 'get_user_error.g.dart';
//
// @JsonSerializable()
// class GetUserErrorModel {
//   String? message;
//
//   GetUserErrorModel({this.message});
//
//   factory GetUserErrorModel.fromJson(Map<String, dynamic> json) => _$GetUserErrorModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GetUserErrorModelToJson(this);
// }