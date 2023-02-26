import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_apis/feautres/notification/business_logic/notification_cubit.dart';
import 'package:youtube_apis/routiong.dart';
import 'core/bloc_observer.dart';
import 'core/cashe_helper.dart';
import 'core/constants/routes_manager.dart';
import 'core/network/web_services.dart';
import 'feautres/home/business_logic/auth_cubit/home_cubit.dart';
import 'feautres/notification/presenation/notification_screen.dart';
import 'feautres/payment/data/purshase_api.dart';
import 'feautres/registeration/business_logic/auth_cubit/firebase_auth_cubit.dart';
import 'feautres/registeration/business_logic/auth_cubit/otp_cubit.dart';
import 'feautres/registeration/business_logic/registeration_cubit/registeration_bloc.dart';
import 'package:bot_toast/bot_toast.dart';
//import notification_screen

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message:\n\n\n ${message.messageId}');
}
Future<void> main() async {

  //wait widget tree to be built
  WidgetsFlutterBinding.ensureInitialized();
  //init git it
  //initGetIt();
  //init shared pref
//  await PurshaseApi.init();
  await CacheHelper.init();
  //prevent landscape mode
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
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
  await DioHelper.init();
  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage\n\n\n');
    print(event.notification!.title);
    print(event.notification!.body);
  });
  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('onMessageOpenedApp\n\n\n\n\n\n\n');
    print(event.notification!.title);
    print(event.notification!.body);

  });
  // background notification
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //firebase messaging PERMISSION
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
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
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => FirebaseAuthCubit()),
        BlocProvider(create: (context) => HomeCubit()
          //..sendNotification(
         // 'integration test yto one', 'math'
         //  )
          // ..sendNotificationToAllStudent('1',
          //   'integration test to math students')
          //..enrollCourse(
         // ' 7Ww1DVgs0gX6eeLochZfVHgIPKz2','1'
        //),
          //..firebaseMessagingGetToken()
       // ..sendFCMNotification(
        //    token: ' flDGSoGOR1GHNenJDDcdU2:APA91bFf1qqqHrmynn2I1Ql6j8y6_RlERSzbKktZYK4n48WL-JVG3vsfVB8Opr4ZV_M1P3QiYkPvdjcUOOGJWEBvBF-SNfCE41BkDFz7IvnoSPPOpNgcItRvUYj9ZBmaa4vCqq5nm_-L ', senderName: 'ahmed' ,messageImage: 'hiiii')
         // ..sendNotification(
          //  '6EAx9TEpHDc5N0ivwDEaTrufL2X2',
        // 'math', 'en')
       // ..getNotification('6EAx9TEpHDc5N0ivwDEaTrufL2X2')

        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) => MaterialApp(

          // localizationsDelegates: [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale('ar', "AE"),
          // ],

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
          initialRoute: AppRoutes.zoom,
          onGenerateRoute:RouteGenerator.generateRoute,
        ),
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
