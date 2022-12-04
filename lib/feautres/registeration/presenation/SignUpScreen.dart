import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/core/constants/styles_manager.dart';
import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
import '../../../core/constants/my_color.dart';
import '../../../network_exceptions.dart';
import '../business_logic/auth_cubit/auth_cubit.dart';
import '../business_logic/auth_cubit/auth_state.dart';
import '../business_logic/registeration_cubit/registeration_bloc.dart';
import '../business_logic/registeration_cubit/registeration_state.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05
              ,top: height * 0.15
              ),
              child: Column(
                children: [
                   SizedBox(
                    height:height*0.031,
                  ),
                  Text(
                    'Sign Up',
                    style: getMediumStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Add your details to Sign Up',
                    style: getMediumStyle(color: Colors.grey, fontSize: 15),
                  ),
                   SizedBox(
                    height: height * 0.02,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '         Name must not be empty';
                        }
                      },
                      label: 'nam'
                          'e',
                      radius: 30),
                  const SizedBox(
                    height: 25,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return '         Mobile No must not be empty';
                        }
                      },
                      label: 'Mobile No',
                      radius: 30),
                   SizedBox(
                    height: height * 0.02,
                  ),

                  BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    // TODO: implement liste
    //  ner
  },
  builder: (context, state) {
   var cubit = RegisterCubit.get(context);
    return defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.length < 6) {
                          return '         Password is to short must be 6 digit or more';
                        }
                      },
                      label: 'Password',
                      suffix: cubit.suffix,
                      isPassword: cubit.isVisable,
                      suffixPressed: () {
                        cubit.togglePasswordVisibilty();
                      },
                      radius: 30);
  },
),
                   SizedBox(
                    height: height * 0.02,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = RegisterCubit.get(context);
    return defaultFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value != passwordController.text) {
                          return '         Wrong password';
                        }
                      },
                      label: 'Confirm Password',
                      suffix: cubit.suffix,
                      isPassword: cubit.isVisable,
                      suffixPressed: () {
                        cubit.togglePasswordVisibilty();
                      },
                      radius: 30);
  },
),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      return state.when(
                        idle: () =>     defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                               AuthCubit.get(context).signUp(
                                     email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                               );
                              }
                            },
                            text: 'Sign Up',
                            radius: 30,
                            isUpperCase: false),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        success: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed(AppRoutes.login);
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

                   //sizedBox
                  SizedBox(
                    height: height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      TextButton(
                          onPressed: () {
                          //  navigateTo login screen with push named
                            Navigator.pushNamed(context, AppRoutes.login);
                            },
                          child: Text(
                            'Login',
                            style: getMediumStyle(color: mainColor, fontSize: 20),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      
  }
}
