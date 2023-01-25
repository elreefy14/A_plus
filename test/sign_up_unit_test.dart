// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/auth_cubit.dart';
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}
//
// void main() {
//   group('SignUpCubit', () {
//     SignUpCubit signUpCubit;
//     MockFirebaseAuth mockFirebaseAuth;
//
//     setUp(() {
//       mockFirebaseAuth = MockFirebaseAuth();
//       signUpCubit = SignUpCubit();
//     });
//
//     final mockFirebaseAuth = MockFirebaseAuth();
//     test('signUp successfully creates a user and emits SignUpSuccessState', () async {
//       when(mockFirebaseAuth.createUserWithEmailAndPassword(
//         email: 'test@email.com',
//         password: 'password',
//       )).thenAnswer((_) => Future.value(AuthResult(
//         user: User(uid: '123'),
//       )));
//
//       final expectedUser = UserModel(
//         uID: '123',
//         phone: '1234567890',
//         email: 'test@email.com',
//         dateTime: FieldValue.serverTimestamp(),
//       );
//
//       expectLater(
//         signUpCubit,
//         emitsInOrder([
//           SignUpLoadingState(),
//           SignUpSuccessState('123'),
//         ]),
//       );
//
//       signUpCubit.signUp(
//         email: 'test@email.com',
//         phone: '1234567890',
//         password: 'password',
//       );
//     });
//
//     test('signUp emits SignUpErrorState if createUserWithEmailAndPassword throws an error', () async {
//       when(mockFirebaseAuth.createUserWithEmailAndPassword(
//         email: 'test@email.com',
//         password: 'password',
//       )).thenThrow(Exception());
//
//       expectLater(
//         signUpCubit,
//         emitsInOrder([
//           SignUpLoadingState(),
//           SignUpErrorState(),
//         ]),
//       );
//
//       signUpCubit.signUp(
//         email: 'test@email.com',
//         phone: '1234567890',
//         password: 'password',
//       );
//     });
//   });
// }
