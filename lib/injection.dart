// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:youtube_apis/core/network/web_services.dart';
// import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/auth_cubit.dart';
// import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/otp_cubit.dart';
// import 'package:youtube_apis/feautres/registeration/business_logic/registeration_cubit/registeration_state.dart';
// import 'package:youtube_apis/feautres/registeration/data/register_repo.dart';
//
// import 'package:youtube_apis/my_repo.dart';
//
// import 'feautres/registeration/business_logic/registeration_cubit/registeration_bloc.dart';
//
// final getIt = GetIt.instance;
//
// void initGetIt() {
//   //getIt.registerLazySingleton<GetUser>(() => GetUser(getIt()));
//   getIt.registerLazySingleton<OtpCubit>(() => OtpCubit(
//         getIt(),
//       ));
//   // //auth cubit
//   // getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(
//   //
//   //     ));
//   // //RegistertState
//   //
//   // getIt.registerLazySingleton<RegisterationRepo>(() => RegisterationRepo(getIt()));
//   // getIt.registerLazySingleton<RestClient>(
//   //     () => RestClient(createAndSetupDio()));
// }
//
//   Dio createAndSetupDio() {
//     Dio dio = Dio();
//
//     dio
//       ..options.connectTimeout = 200 * 1000
//       ..options.receiveTimeout = 200 * 1000;
//
//     dio.interceptors.add(LogInterceptor(
//       responseBody: true,
//       error: true,
//       requestHeader: false,
//       responseHeader: false,
//       request: true,
//       requestBody: true,
//     ));
//
//     return dio;
//   }
