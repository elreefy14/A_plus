import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/userModel.dart';
import 'auth_state.dart';

class SignUpCubit extends Cubit<SocialStates> {
  SignUpCubit() : super(InitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
bool showPassword = true;
void changePasswordVisibility(){
  showPassword = !showPassword;
  emit(ChangePasswordVisibilityState());
}

  Future<void> signUp({
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.uid);
      createUser(
        uId: value.user!.uid,
        phone: phone,
        email: email,
      );
      emit(SignUpSuccessState(value.user!.uid));
    }).catchError((error) {
      String? errorMessage;
   switch (error.code) {
         case "invalid-email":
            if (kDebugMode) {
              errorMessage = 'The email address is badly formatted.';
            }
            break;
          case "user-not-found":
            if (kDebugMode) {
              errorMessage = 'No user found for that email.';
            }
            break;
          case "wrong-password":
            if (kDebugMode) {
              errorMessage = 'Wrong password provided for that user.';
            }
            break;
          default:
            if (kDebugMode) {
              errorMessage = 'The error is $error';
            }
    }
      emit(SignUpErrorState(
        error: errorMessage,
      ));
    });
  }

  void createUser({
    required String? uId,
    required String? phone,
    required String? email,
  }) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(
        uID: uId,
        phone: phone,
        email: email,
        dateTime: FieldValue.serverTimestamp(),
        coverPic: 'https://media.cdnandroid.com/27/54/bb/52/imagen-cartoon-photo-editor-art-filter-2018-1gal.jpg',
        profilePic: 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
        bio: 'Write you own bio...'
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uId!));
    }).catchError((error) {
      emit(CreateUserErrorState());
    });
  }
}

