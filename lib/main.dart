import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/core/constants/routes_manager.dart';
import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/auth_cubit.dart';
import 'package:youtube_apis/injection.dart';
import 'package:youtube_apis/routiong.dart';
import 'core/bloc_observer.dart';
import 'feautres/registeration/business_logic/auth_cubit/otp_cubit.dart';
import 'feautres/registeration/business_logic/registeration_cubit/registeration_bloc.dart';
import 'feautres/registeration/data/register_repo.dart';
import 'feautres/registeration/presenation/SignUpScreen.dart';
import 'feautres/registeration/presenation/login_screen.dart';
import 'package:bot_toast/bot_toast.dart';
Future<void> main() async {
  //wait widget tree to be built
  WidgetsFlutterBinding.ensureInitialized();
  //init git it
  initGetIt();

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
  BlocOverrides.runZoned(() => runApp(const MyApp())
      ,blocObserver: MyBlocObserver());

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
        BlocProvider(
          create: (context) => getIt<AuthCubit>()
          // ..signUp(
          // name: 'ahmed',
          // email: 'alksxssmxlas@gmail.com',
          // password: '123456789',
          // phone: '12341215678123129',
          // )
              // HnY4iDrQceraXoQfjlWpvwSDZDbDJbYFbcjcVQDcDOG2wHrn9UOmk0muvynBpV3qb0OxvA
         // ..logout(
         //   'EnXXg075QUiRZq3TH6RIJGQ0gLnGMXPLG4KnvJgK7fZZfIEAZw1RaPXFrwA3HsDUAXhCFC'
         //   )
         //    ..signIn(
         //     'ahemd@gmail.com',
         //    '123456',)

           //  ..changePassword('iM8Z5Q6HkJO1yBY19cBBZbSiRFA0dNZtxUhtCIoq8zqolziHfGIWpx6iz5fDA3x0bcR6cB',
           // '123456',
           // '123456')
           // ..getUserProfile('iM8Z5Q6HkJO1yBY19cBBZbSiRFA0dNZtxUhtCIoq8zqolziHfGIWpx6iz5fDA3x0bcR6cB')
           //    ..updateUserProfile('iM8Z5Q6HkJO1yBY19cBBZbSiRFA0dNZtxUhtCIoq8zqolziHfGIWpx6iz5fDA3x0bcR6cB',
           //        'ahmed',
           //        '076543',
           //        'ggjjhhj@gmail.com')


        ),

        BlocProvider(create: (context) => getIt<OtpCubit>()
     // ..signUp(
     //    'ksadlkakasah@yahoo.com',
     //     'ksadlkakhaas@yahoo.com',
     //     'asc',
     //   '01000000000',
     //  )
        //    ..signIn(email: 'aya@gmail.com', password: '1121267a')
        // ..signUp2(name: 'ytgh678a',
        //     email: 'kaskakjscjasck@gmail.com',
        //     phone: '1267a',
        //     password: '123456',)
        //
     )
        ,

        BlocProvider(create: (context) => RegisterCubit()),

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
        home: SignUpScreen(),
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