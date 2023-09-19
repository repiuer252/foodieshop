import 'package:flutter/material.dart';
import 'package:uts_asli/home_screen.dart';
import 'package:uts_asli/loginpake/login.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_asli/splash_screen.dart';
import 'package:uts_asli/provider/theme.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<MyProvider>(
        child: const MyApp(),
        create: (BuildContext context) {
          return MyProvider(isDarkTheme);
        },
      ),
    );
  });
  await Firebase.initializeApp();


}



class MyApp extends StatelessWidget {
  static const String title = 'Notes';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.getTheme(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
