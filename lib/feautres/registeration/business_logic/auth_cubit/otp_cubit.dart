import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:meta/meta.dart';
import 'package:youtube_apis/feautres/registeration/business_logic/registeration_cubit/registeration_state.dart';
import 'package:youtube_apis/feautres/registeration/data/register_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.registerationRepo) : super(AuthInitial());
final RegisterationRepo? registerationRepo;
  static OtpCubit get(context) => BlocProvider.of(context);
  static String? verificationIdd;
  static UserCredential? user;
  //print ip address of physical device using get ip ADDRESS package
  void printIp() async {
    var ipAddress = IpAddress(type: RequestType.json);
    dynamic data = await ipAddress.getIpAddress();
  print('ip address is \n\n\n\n\n\n\n$data');
  print(data);

  }

  //sign up using registeration repo
  // void signUp(String name, String email, String phone, String password) async {
  //   emit(AuthLoading());
  //   try {
  //     final response = await registerationRepo?.signIn(email ,password);
  //    print(response?.status);
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     print(e);
  //     emit(AuthError(e.toString()));
  //   }
  // }
  //use dio to send post request to server to sign up user
  void signUp2({
      required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(AuthLoading());
    try {
      final response = await Dio().post(
        'https://elreefy.me/sign_up.php',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'verifycode': '16723',
          'password': password,
        },
      );
      print(response.data);
      emit(AuthSuccess());
    } catch (e) {
      print(e);
      emit(AuthError(e.toString()));
    }
  }
  //sign in using retrofit to send post request to server


   void signIn({
      required String email,
      required String password}) async {
    emit(AuthLoading());
    try {
      final response = await Dio().post(
        'https://elreefy.me/login.php.php',
        data: {
          'email': email,
          'password': password,
        },
      );
      emit(AuthSuccess());
    } catch (e) {
      print(e);
      emit(AuthError(e.toString()));
    }
  }


  // final MyRepo myRepo;
  // RegisterCubit(this.myRepo) : super(const Idle());
  //print my name
  void printMyName() {
    print('Ahmed');
  }
  Future<void> phoneNumberSubmitted(String phoneNumber)async {
    emit(phoneNumberSubmittedLoading());
    print('ANA MOGOOOOOD');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted:  _verificationCompleted(),
      verificationFailed:  _verificationFailed(),
      codeSent:await _codeSent(),
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(),
    );
    //TODO: add state for success
    emit(PhoneNumberSubmittedloaded());
  }
  Future<void> otpSubmitted (String otp) async {
    emit(OTPLoading());
    print('MY VERIFIACATION ID: $verificationIdd');
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdd!,
      smsCode: otp,
    );
    user = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    emit(OtpVerified());
  }
  _codeSent() async{
    return   (String verificationId, [int? forceResendingToken]) {
      print('MY code sent');
      print(verificationId);
      print('MY TOKEN');
      print(forceResendingToken);
      verificationIdd=verificationId;
      emit(OTPSent());
    };

  }

  _verificationCompleted()  {
    return (AuthCredential credential) {
      print('My verification completed');
      print(credential);
      emit(OtpVerified());
    };
  }
  _verificationFailed()  {
    return (exception) {
      print('My verification failed');
      print(exception);
      emit(AuthErrorOccur(exception.message));
    };
  }
  _codeAutoRetrievalTimeout()  {
    return (String verificationId) {
      print('MY code auto retrieval timeout');
      print(verificationId);
      emit(AuthErrorOccur('MY code auto retrieval timeout'));

    };
  }
  User getloggedInUser(){
    User user=FirebaseAuth.instance.currentUser!;
    return user;
  }


}
