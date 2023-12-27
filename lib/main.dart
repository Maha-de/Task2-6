import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/login.pages.dart';
import 'package:task_3/pages/splash_screen.pages.dart';
import 'package:task_3/services/preferences.services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
  PrefrencesService.prefs = await SharedPreferences.getInstance();

  if (PrefrencesService.prefs != null) {
    print("prefrences init successfully");
  }
}catch (e) {
    print("Error in init Prefrences ${e}");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
          primarySwatch: Colors.cyan),
      home: SplashScreen(),
    );
  }
}
