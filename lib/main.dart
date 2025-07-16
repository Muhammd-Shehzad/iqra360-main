import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iqra360/Model/Auth/login_view_model.dart';
import 'package:iqra360/Model/Auth/sign_up_view_model.dart';
import 'package:iqra360/Model/Home/home_screen_view_model.dart';
import 'package:iqra360/Model/ListViewAllScreens/duain_view_model.dart';
import 'package:iqra360/Model/ListViewAllScreens/names_view_model.dart';
import 'package:iqra360/Model/ListViewAllScreens/quran_view_Model.dart';
import 'package:iqra360/Model/ListViewAllScreens/tasbeeh_view_model.dart';
import 'package:iqra360/Model/QuranListView/qul_surahs_view_model.dart';
import 'package:iqra360/Model/Setting/setting_view_model.dart';
import 'package:iqra360/Model/SplahScreen/splash_view_model.dart';
import 'package:iqra360/Model/Surah/AlQuran/al_quran_view_model.dart';
import 'package:iqra360/Model/Surah/surah_screen_view_model.dart';
import 'package:iqra360/View/Setting/languages.dart';
import 'package:iqra360/firebase_options.dart';
import 'package:iqra360/Model/utils/Routes/routes.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   final FlutterLocalization localization = FlutterLocalization.instance;

//   localization.init(mapLocales: LocalesData.LOCALES, initLanguageCode: 'en');

//   runApp(MyApp(localization: localization));
// }

// class MyApp extends StatelessWidget {
//   final FlutterLocalization localization;

//   const MyApp({super.key, required this.localization});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       designSize: const Size(360, 690),
//       splitScreenMode: true,
//       builder:
//           (context, child) => MultiProvider(
//             providers: [
//               ChangeNotifierProvider(create: (context) => SplashViewModel()),
//               ChangeNotifierProvider(create: (context) => SignUpViewModel()),
//               ChangeNotifierProvider(create: (context) => LoginViewModel()),
//               ChangeNotifierProvider(create: (context) => DuainViewModel()),
//               ChangeNotifierProvider(create: (context) => QuranViewModel()),
//               ChangeNotifierProvider(create: (context) => NamesViewModel()),
//               ChangeNotifierProvider(create: (context) => TasbeehViewModel()),
//               ChangeNotifierProvider(create: (context) => QulSurahsViewModel()),
//               ChangeNotifierProvider(create: (context) => SettingViewModel()),
//               ChangeNotifierProvider(
//                 create: (context) => SurahScreenViewModel(),
//               ),
//               ChangeNotifierProvider(
//                 create: (context) => HomeScreenViewModel(),
//               ),
//               ChangeNotifierProvider(create: (context) => AlQuranViewModel()),
//               ChangeNotifierProvider(
//                 create: (context) => TranslationViewModel(),
//               ),
//             ],
//             child: GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               initialRoute: RoutesName.SplashScreen,
//               onGenerateRoute: Routes.generateRoute,

//               /// ✅ Localization setup
//               supportedLocales: localization.supportedLocales,
//               localizationsDelegates: localization.localizationsDelegates,
//               locale: localization.currentLocale,
//             ),
//           ),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // MUST come first

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder:
          (context, child) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => SplashViewModel()),
              ChangeNotifierProvider(create: (context) => SignUpViewModel()),
              ChangeNotifierProvider(create: (context) => LoginViewModel()),
              ChangeNotifierProvider(create: (context) => DuainViewModel()),
              ChangeNotifierProvider(create: (context) => QuranViewModel()),
              ChangeNotifierProvider(create: (context) => NamesViewModel()),
              ChangeNotifierProvider(create: (context) => TasbeehViewModel()),
              ChangeNotifierProvider(create: (context) => QulSurahsViewModel()),
              ChangeNotifierProvider(create: (context) => SettingViewModel()),
              ChangeNotifierProvider(
                create: (context) => SurahScreenViewModel(),
              ),
              ChangeNotifierProvider(
                create: (context) => HomeScreenViewModel(),
              ),
              ChangeNotifierProvider(create: (context) => AlQuranViewModel()),
            ],
            child: GetMaterialApp(
              initialRoute: RoutesName.SplashScreen,
              onGenerateRoute: Routes.generateRoute,
              debugShowCheckedModeBanner: false,
              translations: Languages(),
              locale: Locale('ur', 'PK'),
              fallbackLocale: Locale('en', 'US'),
            ),
          ),
    ),
  );
}
