import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../network_exceptions.dart';
import '../../data/register_model.dart';
import '../../data/register_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState<dynamic>> {
  final RegisterationRepo myRepo;
  AuthCubit(this.myRepo) : super( const Idle());
  static AuthCubit get(context) => BlocProvider.of(context);

  // Future<void> emitGetAllUsers() async {
  //   final result = await myRepo.getAllUsers();
  //
  //   result.when(
  //     success: (List<User> allUsers) {
  //       emit(ResultState.success(allUsers));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ResultState.error(networkExceptions));
  //     },
  //   );
  // }

 //sign in using RegisterationRepo
  Future<void> signIn(String email, String password) async {
    emit(
      AuthState.loading(),
    );
    final result = await myRepo.signIn(email, password);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        emit(AuthState.success());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }
  Future<void> signUp({required String email,
    required String password,
    required String phone,
    required String name}) async {
    emit(
      AuthState.loading(),
    );
    final result = await myRepo.signUp(email,password,phone,name);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        print('\n\n\n\n\n');
        print(user?.data.token);
        print(user?.data.phone);
        print(user?.data.id);
        emit(AuthState.success());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }
  //logout
  Future<void> logout(String token) async {
    //wait for 20 seconds
    await Future.delayed(Duration(seconds: 20));
    final result = await myRepo.logout(token);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        print('\n\n\n\n\n');
        print(user?.data.token);
        print(user?.data.id);
        emit(AuthState.success());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }
  //change password
  Future<void> changePassword(String token,String oldPassword,String newPassword) async {
    emit(
      AuthState.loading(),
    );
    final result = await myRepo.changePassword(token,oldPassword,newPassword);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        print('\n\n\n\n\n');
        print(user?.data.email);
        emit(AuthState.success());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }
  //get user profile
  Future<void> getUserProfile(String token) async {
    final result = await myRepo.getProfile(token);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        print('\n\n\n\n\n');
        print(user?.data.email);
        emit(AuthState.success());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }
  //update user profile
  Future<void> updateUserProfile(String token,String name,String phone,String email) async {
    final result = await myRepo.updateProfile(token,name,email,phone);
    result.when(
      //???????????????????????????????????
      success: (RegisterModel? user) {
        print('\n\n\n\n\n');
        print(user?.data.email);
        emit(AuthState.success());
      },
     failure: (NetworkExceptions networkExceptions) {
        emit(AuthState.error(networkExceptions));
      },
    );
  }



  // Future<void> emitGetUserDetails(int userId) async {
  //   final result = await myRepo.getUserById(userId);
  //
  //   result.when(
  //     success: (User user) => emit(ResultState.success(user)),
  //     failure: (NetworkExceptions networkExceptions) =>
  //         emit(ResultState.error(networkExceptions)),
  //   );
  // }
  //
  // Future<void> emitCreateNewUser(User newUser) async {
  //   final result = await myRepo.createNewUser(newUser);
  //
  //   result.when(
  //     success: (User userData) {
  //       emit(ResultState.success(userData));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ResultState.error(networkExceptions));
  //     },
  //   );
  // }
  //
  // Future<void> emitDeleteUser(int userId) async {
  //   final result = await myRepo.deleteUser(userId);
  //   result.when(
  //     success: (HttpResponse response) => emit(ResultState.success(response)),
  //     failure: (NetworkExceptions networkExceptions) =>
  //         emit(ResultState.error(networkExceptions)),
  //   );
  // }
}
