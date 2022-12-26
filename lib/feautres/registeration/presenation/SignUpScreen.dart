import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/core/constants/styles_manager.dart';
import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
import '../../../core/constants/my_color.dart';
import '../business_logic/auth_cubit/firebase_auth_cubit.dart';
import '../business_logic/registeration_cubit/registeration_bloc.dart';
import '../business_logic/registeration_cubit/registeration_state.dart';
import 'login_screen.dart';
//Todo:feh form bta3 il validation bs bydrably error
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    var addressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
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
                  //4 text fields with validation and controller and focus node and on submit to take name and phone and password and confirm password
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nameController,

                          icon: Icons.person,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          }, label: 'Name',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          label: 'Email',
                          controller: emailController,
                          icon: Icons.email,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          label: 'Phone',
                          controller: phoneController,
                          icon: Icons.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          label: 'Address',
                          controller: addressController,
                          icon: Icons.location_on,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          label: 'Password',
                          controller: passwordController,
                          icon: Icons.lock,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomTextField(
                          label: 'Confirm Password',
                          controller: confirmPasswordController,
                          icon: Icons.lock,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your confirm password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),


                  BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      return defaultButton(
                            function: () {
                              // if (formKey.currentState!.validate()) {
                              //   FirebaseAuthCubit.get(context).signUp(
                              //       // password: passwordController.text,
                              //       // name: nameController.text,
                              //       // phone: phoneController.text,
                              //     password: passwordController.text,
                              //       name: nameController.text,
                              //       phone: phoneController.text,
                              //  );
                              // }
                            },
                            text: 'Sign Up',
                            radius: 30,
                            isUpperCase: false);
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
  },
);

  }
}
