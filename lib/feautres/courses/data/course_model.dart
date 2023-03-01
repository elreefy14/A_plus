// //'course_id': '1',
// //       'courseName': 'math1',
// //       'chapters': [
// //         {'title': 'integration', 'isChapterSeen': false},
// //         {'title': 'defrantiation', 'isChapterSeen': false}
// //       ],
// //       'courseImage' :'https://tse2.mm.bing.net/th?id=OIP.XW5L06-psFC_oVws6Kgq2QHaFS&pid=Api&P=0' ,
// // make course model and use it in home cubit and home layout using
//
// class CourseModel {
//   String? course_id;
//   String? courseName;
//   List<ChapterModel>? chapters;
//   String? courseImage;
//   CourseModel({
//     required this.course_id,
//     required this.courseName,
//     required this.chapters,
//     required this.courseImage,
//   });
//   factory CourseModel.fromJson(Map<String, dynamic> json) {
//     return CourseModel(
//       course_id: json['course_id'],
//       courseName: json['courseName'],
//       chapters: json['chapters'],
//       courseImage: json['courseImage'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'course_id': course_id,
//       'courseName': courseName,
//       'chapters': chapters,
//       'courseImage': courseImage,
//     };
//   }
// }
//
// class ChapterModel {
//   String? title;
//   bool? isChapterSeen;
//   ChapterModel({
//     required this.title,
//     required this.isChapterSeen,
//   });
//   factory ChapterModel.fromJson(Map<String, dynamic> json) {
//     return ChapterModel(
//       title: json['title'],
//       isChapterSeen: json['isChapterSeen'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'isChapterSeen': isChapterSeen,
//     };
//   }
// }