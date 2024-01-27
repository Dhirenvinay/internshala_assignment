import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/splashprovider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late SplashProvider splashProvider;

  @override
  void initState() {
    super.initState();
    splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.initAnimation(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<SplashProvider>(
              builder: (context, provider, child) {
                return Image.asset(
                  'assets/images/internshala.png',
                  width: provider.animation.value * 300,
                  height: provider.animation.value * 300,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
