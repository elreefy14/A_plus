//rest client abstract class with retrofit annotation and base url
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youtube_apis/feautres/registeration/data/register_model.dart';
part 'web_services.g.dart';
@RestApi(baseUrl:'https://student.valuxapps.com/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  @POST("/login")
  Future<RegisterModel> signIn(
      //send email and password as body type raw
      @Body() Map<String, dynamic> body,
      //send headers lang with default value ar
      @Header("lang") String token,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      );
  //post request to sign up user
  @POST("/register")
  Future<RegisterModel> signUp(
      //send email and password as body type raw
      @Body() Map<String, dynamic> body,
      //send headers lang with default value ar
      @Header("lang") String token,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      );
  //logout user
  @POST("/logout")
  Future<RegisterModel> logout(
      //send Authorization as header 
      @Header("Authorization") String token,
      //send headers lang with default value ar
      @Header("lang") String lang,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      );
  //change-password
  @POST("/change-password")
  Future<RegisterModel> changePassword(
      @Body() Map<String, dynamic> body,
      //send Authorization as header
      @Header("Authorization") String token,
      //send headers lang with default value ar
      @Header("lang") String lang,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      //send old password and new password as body type raw
      );
  //get profile data from server
  @GET("/profile")
  Future<RegisterModel> getProfile(
      //send Authorization as header
      @Header("Authorization") String token,
      //send headers lang with default value ar
      @Header("lang") String lang,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      );
  //put profile data
  @PUT("/update-profile")
  Future<RegisterModel> updateProfile(
      @Body() Map<String, dynamic> body,
      //send Authorization as header
      @Header("Authorization") String token,
      //send headers lang with default value ar
      @Header("lang") String lang,
      //send headers lang with default value ar
      @Header("Content-Type") String contentType,
      //send name and email as body type raw

      );




 //
  
  


// @POST("/sign_up.php")
  // Future<RegisterModel> signUp(
   //     @Body() Map<String, dynamic> body);
  // @POST("/login.php")
  // Future<RegisterModel> signIn(
  //     @Body() Map<String, dynamic> body);

}