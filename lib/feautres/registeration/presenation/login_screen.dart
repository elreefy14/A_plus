import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_apis/core/constants/font_manager.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/core/constants/styles_manager.dart';
import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/auth_state.dart';
import 'package:youtube_apis/feautres/registeration/business_logic/registeration_cubit/registeration_bloc.dart';
import 'package:youtube_apis/feautres/registeration/presenation/reset_password_screen.dart';
import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
import 'package:youtube_apis/injection.dart';

import '../../../core/constants/my_color.dart';
import '../../../network_exceptions.dart';
import '../business_logic/auth_cubit/auth_cubit.dart';
import '../business_logic/registeration_cubit/registeration_state.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Text(
                        'Login',
                        style:
                            getMediumStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        'Add your details to login',
                        style: getRegularStyle(
                            color: Colors.grey[700]!,
                            fontSize: FontSizeManager.s18),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return '         Email must not be empty';
                            }
                          },
                          label: 'Your Email',
                          radius: 30),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.length < 6) {
                              return '         Password is to short must be 6 digit or more';
                            }
                          },
                          label: 'Password',
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword: RegisterCubit.get(context).isVisable,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .togglePasswordVisibilty();
                          },
                          radius: 30),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                        },
                        builder: (context, state) {
                          return state.when(
                            idle: () => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).signIn(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                text: 'Login',
                                radius: 30,
                                isUpperCase: false),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            success: () {
                              Navigator.pop(context);
                              Navigator.of(context).pushNamed(AppRoutes.newPassword);
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            error: (NetworkExceptions networkExceptions) {
                              return Center(
                                child: Text(NetworkExceptions.getErrorMessage(
                                    networkExceptions)),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, ResetPasswordScreen());
                        },
                        child: Text(
                          'Forgot your password?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'or Login With',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      defaultButton(
                          function: () {
                            RegisterCubit.get(context).fbSignIn();
                          },
                          text: 'Login with Facebook',
                          radius: 30,
                          fontSize: 12,
                          prefix: FontAwesomeIcons.facebookF,
                          fontFamily: 'Metropolis-Medium',
                          backgroundColor: Color(0xFF367FC0),
                          isUpperCase: false),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      defaultButton(
                          function: () {
                            RegisterCubit.get(context).googleSignIn();
                          },
                          text: 'Login with Google',
                          radius: 30,
                          fontSize: 12,
                          prefix: FontAwesomeIcons.googlePlusG,
                          fontFamily: 'Metropolis-Medium',
                          backgroundColor: Color(0xFFDD4B39),
                          isUpperCase: false),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an Account?',
                            style: getRegularStyle(
                                color: Colors.black,
                                fontSize: FontSizeManager.s16),
                          ),
                          TextButton(
                              onPressed: () {
                              //navigate to sign up screen with push named
                                Navigator.of(context).pushNamed(AppRoutes.resetCode);
                                },
                              child: Text(
                                'Sign Up',
                                style: getBoldStyle(
                                    color: mainColor,
                                    fontSize: FontSizeManager.s16),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
