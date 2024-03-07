import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../template_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeOut);
    _animationController!.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const TemplatePage());
      // Navigate to the home screen or the next screen
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.amber.withOpacity(0.7),
          Colors.red.withOpacity(0.7),
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: FadeTransition(
          opacity: _animation!,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/icon/icons.png",
                    fit: BoxFit.contain,
                    scale: 10,
                  ),
                ),
                SizedBox(height: 10),
                Text("QR SHOTS",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
