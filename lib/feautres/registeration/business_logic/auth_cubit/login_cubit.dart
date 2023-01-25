

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/userModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;

  void signIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    print('email\n\n\n');
   print(email);
   print(password);
    //
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
     // error?.printStackTrace();
//transform firbase error to string which user could understand
      String errorMessage;
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Invalid email";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Wrong password";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User not found";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User has been disabled";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests, please try again later";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Operation not allowed";
          break;
        default:
          errorMessage = "An error occurred, please try again later";
      }
      print('error message:\n\n\n\n\n\n\n');
      print(errorMessage);
      emit(LoginErrorState(errorMessage));
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  bool userExist = false;
  Future <void> isUserExist({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic

  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if(element.id == uId)
          userExist = true;
      });
      if(userExist == false) {
        createGoogleUser(
            uId: uId,
            name: name,
            phone: phone,
            email: email,
            profilePic: profilePic
        );
      }
      else
        emit(LoginGoogleUserSuccessState(uId!));
    });
  }

  void getGoogleUserCredentials() async {
    emit(LoginGoogleUserLoadingState());
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isUserExist(
          uId: value.user!.uid,
          name: value.user!.displayName,
          phone: value.user!.phoneNumber,
          email: value.user!.email,
          profilePic: value.user!.photoURL
      );

    });
  }


  void createGoogleUser({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic
  }) {
    UserModel model = UserModel(
      uID: uId,
      name: name,
      phone: phone?? '0000-000-0000',
      email: email,
      dateTime: FieldValue.serverTimestamp(),
      coverPic: 'https://media.cdnandroid.com/27/54/bb/52/imagen-cartoon-photo-editor-art-filter-2018-1gal.jpg',
      profilePic: profilePic ?? 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
      bio: 'Write you own bio...',
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
        .then((value) {
      emit(CreateGoogleUserSuccessState(uId!));
    }).catchError((error) {
      emit(CreateGoogleUserErrorState());
    });
  }

  bool showPassword = false;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void changeSuffixIcon(context) {
    showPassword = !showPassword;
    if (showPassword)
      suffixIcon = Icons.visibility_outlined;
    else
      suffixIcon = Icons.visibility_off_outlined;
    emit(ChangeSuffixIconState());
  }


}

