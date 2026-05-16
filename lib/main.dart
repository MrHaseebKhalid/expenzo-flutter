import 'package:expenzo/resources/resources.dart';
import 'package:expenzo/screens/app/provider/app_provider.dart';
import 'package:expenzo/screens/auth/app_starter/splash.dart';
import 'package:expenzo/screens/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: R.themes.lightTheme,
      darkTheme: R.themes.darkTheme,

      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
    );
  }
}
