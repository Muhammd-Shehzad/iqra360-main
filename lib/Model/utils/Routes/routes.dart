import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Duain/duain.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Names/names.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/QariList/qari_list.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/quran.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Tasbeeh/tasbeeh.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/Surah/al_quran.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/Surah/surah_screen.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/JuzzScreen/juzz_list_screen.dart';
import 'package:iqra360/View/Auth/Login/login.dart';
import 'package:iqra360/View/Auth/SignUp/sign_up.dart';
import 'package:iqra360/View/Home/home_screen.dart';
import 'package:iqra360/View/Setting/languages.dart';
import 'package:iqra360/View/Setting/setting_screen.dart';
import 'package:iqra360/View/SplahScreen/splash_screen.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.SplashScreen:
        return GetPageRoute(settings: settings, page: () => SplashScreen());
      case RoutesName.Login:
        return GetPageRoute(settings: settings, page: () => LogIn());
      case RoutesName.SignUp:
        return GetPageRoute(settings: settings, page: () => SignUp());
      case RoutesName.HomeScreen:
        return GetPageRoute(settings: settings, page: () => HomeScreen());

      case RoutesName.Names:
        return GetPageRoute(settings: settings, page: () => Names());
      case RoutesName.DuainScreen:
        return GetPageRoute(settings: settings, page: () => Duain());
      case RoutesName.QuranScreen:
        return GetPageRoute(settings: settings, page: () => Quran());
      case RoutesName.TasbeehScreen:
        return GetPageRoute(settings: settings, page: () => Tasbeeh());
      case RoutesName.SurahScreen:
        return GetPageRoute(settings: settings, page: () => SurahListScreen());
      case RoutesName.JuzScreen:
        return GetPageRoute(settings: settings, page: () => JuzListScreen());
      case RoutesName.AlQuranScreen:
        return GetPageRoute(settings: settings, page: () => AlQuran());
      
      case RoutesName.SettingScreen:
        return GetPageRoute(settings: settings, page: () => SettingsScreen());
      
      case RoutesName.QariListScreen:
        return GetPageRoute(settings: settings, page: () => QariList());
      

      default:
        return GetPageRoute(
          settings: settings,
          page: () => Text('No route Define'),
        );
    }
  }
}
