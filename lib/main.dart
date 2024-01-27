// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:internshalaassignment/screens/home.dart';
import 'package:internshalaassignment/provider/homeprovider.dart';
import 'package:internshalaassignment/provider/splashprovider.dart';
import 'package:internshalaassignment/screens/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          cardTheme: const CardTheme(color: Colors.white),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
