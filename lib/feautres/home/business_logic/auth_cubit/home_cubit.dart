import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
 //COURSES ( course_id , courseName, lisit of chapter title , isChapterSeen)
  void addCourse() {
    emit(HomeLoadingState());
    // add courses to the list of courses first COURSES ( '1' , 'math1', ['integration ,'defrantiation''] , false)
    // use firebase database
    // bool isChapterSeen is a variable inicate if student see the chapter or not, if he see it, it will be true
    // if he didn't see it, it will be false
    FirebaseFirestore.instance.collection('courses').add({
      'course_id': '1',
      'courseName': 'math1',
      //chapters is a martix of chapter title and isChapterSeen
      'chapters': [
        {'title': 'integration', 'isChapterSeen': false},
        {'title': 'defrantiation', 'isChapterSeen': false}
      ]
    }).then((value) {
      print('course added \n\n\n\n\n');
      emit(HomeSuccessState());
    }).catchError((error) {
      print('Failed to add course:\n\n\n $error');
      emit(HomeErrorState());
    });
    }

  //enrolled (student_id, course_code, quarter, enrolled_at) .
  void enrollCourse() {
    emit(enrollLoadingState());
    FirebaseFirestore.instance.collection('enrolled').add({
      'student_id': '1',
      'course_code': '1',
      'quarter': '1',
      'enrolled_at': '1'
    }).then((value) {
      print('course enrolled');
      emit(enrollSuccessState());
    }).catchError((error) {
      print('Failed to enroll course: $error');
      emit(enrollErrorState());
    });
    }







}
