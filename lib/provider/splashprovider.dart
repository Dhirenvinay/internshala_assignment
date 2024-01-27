import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internshalaassignment/screens/home.dart';

class SplashProvider with ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> animation;

  void initAnimation(BuildContext context, vsync) {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: vsync);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    animation.addListener(() => notifyListeners());
    animationController.forward();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }
}
