import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/auth_cubit.dart';
import 'package:youtube_apis/injection.dart';
import 'package:youtube_apis/routiong.dart';
import 'core/bloc_observer.dart';
import 'feautres/home/business_logic/auth_cubit/home_cubit.dart';
import 'feautres/home/business_logic/presenation/home.dart';
import 'feautres/registeration/business_logic/auth_cubit/firebase_auth_cubit.dart';
import 'feautres/registeration/business_logic/auth_cubit/otp_cubit.dart';
import 'feautres/registeration/business_logic/registeration_cubit/registeration_bloc.dart';
import 'feautres/registeration/data/register_repo.dart';
import 'feautres/registeration/presenation/SignUpScreen.dart';
import 'feautres/registeration/presenation/login_screen.dart';
import 'package:bot_toast/bot_toast.dart';

import 'feautres/registeration/presenation/reset_code_screen.dart';

Future<void> main() async {
  //wait widget tree to be built
  WidgetsFlutterBinding.ensureInitialized();
  //init git it
  //initGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //make bottom bar transparent
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  // RegisterationRepo repo = getIt<RegisterationRepo>();
  // repo.signIn(
  // 'ahemd@gmail.com',
  //    '123456789',
  // );
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );

  //initGetIt();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver());

  // WebServices webServices = getIt<WebServices>();
  //  webServices.getNowPlaying('c3435cfe40aeb079689227d82bf921d3').then((value) {
  //    print(value.results![0].title);
  //    print(value.results![0].posterPath);
  //    print(value.results![0].overview);
  //    print(value.results![0].releaseDate);
  //  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => FirebaseAuthCubit()),
        BlocProvider(create: (context) => HomeCubit()..addCourse()
        ..enrollCourse()),
      ],
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        //debugShowCheckedModeBanner: false,
        // home:  zoom(),
        ///////////////////////
        //initialRoute: AppRoutes.mainRoute,
        //onGenerateRoute:RouteGenerator.generateRoute,

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeLayout(),
      ),
    );
  }
}
//
// <?xml version="1.0" encoding="utf-8"?>
// <network-security-config>
// <domain-config cleartextTrafficPermitted="true">
// <domain includeSubdomains="true">10.0.2.2</domain>
// </domain-config>
// </network-security-config>

// <?xml version="1.0" encoding="utf-8"?>
// <network-security-config>
// <domain-config cleartextTrafficPermitted="true">
// <domain includeSubdomains="true">192.168.1.9</domain> <!-- Debug port -->
// <domain includeSubdomains="true">xamarin.com</domain>
// </domain-config>
// </network-security-config>
