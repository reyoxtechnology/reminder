import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Onboarding/onboarding.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool("isLoggedIn") ?? false);
  Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp(isLoggedIn)));
}

class MyApp extends StatelessWidget {
  final bool? isLoggedIn;
  MyApp(this.isLoggedIn);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (){
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme.copyWith(colorScheme: theme.colorScheme.copyWith(primary: AppTheme.primary, secondary: AppTheme.secondary)),
              home: isLoggedIn == false ?
              OnBoardingScreen()
                  : DashBoard(),
          );
        }
    );
  }
}
