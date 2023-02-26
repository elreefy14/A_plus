import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/feautres/home/business_logic/auth_cubit/home_cubit.dart';
import 'package:youtube_apis/feautres/home/presenation/widget/bottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Text('Profile Screen'),
            ElevatedButton(
              onPressed: () {
              //  HomeCubit.get(context).signOut();
              },
              child: Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }
}
