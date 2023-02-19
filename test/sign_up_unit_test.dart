// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:youtube_apis/core/network/web_services.dart';
// import 'package:youtube_apis/feautres/notification/business_logic/notification_cubit.dart';
//
// class DioHelperMock extends Mock implements DioHelper {}
//
// void main() {
//   DioHelperMock dioHelperMock;
//   NotificationCubit cubit;
//
//   setUp(() {
//      dioHelperMock = DioHelperMock();
//     cubit = NotificationCubit();
//   });
//
//   test('sendFCMNotification should call postData with correct data', () async {
//     // arrange
//     final token = 'abc123';
//     final senderName = 'Test User';
//     final messageText = 'Hello World';
//     final messageImage = null;
//     when(dioHelperMock.postData(data: anyNamed('data'))).thenAnswer((_) => Future.value(null));
//
//     // act
//     cubit.sendFCMNotification(token: token, senderName: senderName, messageText: messageText, messageImage: messageImage);
//
//     // assert
//       verify(dioHelperMock.postData(
//         data: {
//           "to": "$token",
//           "notification": {
//             "title": "$senderName",
//             "body": "$messageText",
//             "sound": "default"
//           },
//           "android": {
//             "Priority": "HIGH",
//           },
//           "data": {
//             "type": "order",
//             "id": "87",
//             "click_action": "FLUTTER_NOTIFICATION_CLICK"
//           }
//         }
//     ));
//   });
// }
