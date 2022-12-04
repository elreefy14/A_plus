//Repository for Registeration feature
import 'package:youtube_apis/core/network/web_services.dart';
import 'package:youtube_apis/feautres/registeration/data/register_model.dart';

import '../../../api_result.dart';
import '../../../network_exceptions.dart';

class RegisterationRepo {
  final RestClient? restClient;
  RegisterationRepo(this.restClient);
  Future<ApiResult<RegisterModel?>> signIn(email,password) async {
   try{
     final response=await restClient?.signIn(
          {
            "email":email,
            "password":password,
          }
          , "ar", "application/json");
     print('\n\n\n\n\n\n\n\n');
     print(response?.status);
     print(response?.status);
     return ApiResult.success(response);
   }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  Future<ApiResult<RegisterModel?>> signUp(email,password,phone,name) async {
    try{
      final response=await restClient?.signUp(
          {
            "name":name,
            "email":email,
            "phone":phone,
            "password":password,
          }
          , "ar", "application/json"
      );
      print('\n\n\n\n\n\n\n\n');
      print(response?.status);
      print(response?.status);
      return ApiResult.success(response);
    }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  //logout
  Future<ApiResult<RegisterModel?>> logout(String token) async {
    try{
      final response=await restClient?.logout(
          token
          , "ar", "application/json"
      );
      print('\n\n\n\n\n\n\n\n');
      print(response?.status);
      print(response?.status);
      return ApiResult.success(response);
    }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  //change password
  Future<ApiResult<RegisterModel?>> changePassword(String token,String oldPassword,String newPassword) async {
    try{
      final response=await restClient?.changePassword(

          {
            "current_password": oldPassword,
            "new_password": newPassword
          },token
          , "ar", "application/json"
      );
      print('\n\n\n\n\n\n\n\n');
      print(response?.status);
      print(response?.status);
      return ApiResult.success(response);
    }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  //get profile
  Future<ApiResult<RegisterModel?>> getProfile(String token) async {
    try{
      final response=await restClient?.getProfile(
          token
          , "ar", "application/json"
      );
      print('\n\n\n\n\n\n\n\n');
      print(response?.status);
      print(response?.status);
      return ApiResult.success(response);
    }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  //update profile
  Future<ApiResult<RegisterModel?>> updateProfile(String token,String name,String email,String phone) async {
    try{
      final response=await restClient?.updateProfile(
          {
            "name": name,
            "email": email,
            "phone": phone,
          },token
          , "ar", "application/json"
      );
      print('\n\n\n\n\n\n\n\n');
      print(response?.status);
      print(response?.status);
      return ApiResult.success(response);
    }
    catch(e){
      print(e);
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

}