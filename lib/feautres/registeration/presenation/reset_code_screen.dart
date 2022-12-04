import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:youtube_apis/core/constants/font_manager.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/core/constants/strings.dart';
import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';

import '../../../core/constants/my_color.dart';
import '../../../core/constants/styles_manager.dart';
import '../business_logic/auth_cubit/otp_cubit.dart';
import 'new_password_screen.dart';

class ResetCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
               SizedBox(
                height: height * 0.1,
              ),
              Text(
                'We have sent an OTP to',
                style:  getSemiBoldStyle(color: Colors.black, fontSize: FontSizeManager.s22),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'your Mobile',
                style: getSemiBoldStyle(color: Colors.black, fontSize: FontSizeManager.s22),
              ),
               SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Please check your mobile number 010*******12',
                style:  getMediumStyle(color: Colors.grey, fontSize: FontSizeManager.s18),
              ),
               SizedBox(
                height: height * 0.05,
              ),
              BlocConsumer<OtpCubit, OtpState>(
  listener: (context, state) {
    if (state is OtpVerified) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewPasswordScreen()));
    }
  },
  builder: (context, state) {
    return Pinput(

                preFilledWidget: Text(
                  '*',
                  style: getRegularStyle(color: Colors.grey[800]!, fontSize: FontSizeManager.s40),
                ),
                showCursor: false,
                length: 6,
                submittedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(20)),
                ),
                followingPinTheme: PinTheme(
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(20)),
                ),
                disabledPinTheme:
                PinTheme(decoration: BoxDecoration(color: Colors.black)
                ),
                separator: SizedBox(
                  width: width * 0.1,
                ),
                onCompleted: (String value) {
                  OtpCubit.get(context).otpSubmitted(value);
                },
              );
  },
),
               SizedBox(
                height: height * 0.05,
              ),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state)
                {
                  if (state is OtpVerified) {
                    Navigator.pushNamed(
                        context,
                        AppRoutes.newPassword);
                  }
                },
             builder: (context, state) {
               return defaultButton(
                  function: () {
                    //show toast uncorrect code
                  showToast(state: ToastStates.ERROR, msg: 'uncorrect code');
                  },
                  text: 'Next',
                  radius: 30,
                  isUpperCase: false);
  },
),
               SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t Receive? ',
                    style: getMediumStyle(color: Colors.black, fontSize: FontSizeManager.s18),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Click Here',
                        style: getBoldStyle(color: mainColor, fontSize: FontSizeManager.s30),
                        ),
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
