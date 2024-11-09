import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/splash_controller.dart';

import 'package:shimmer/shimmer.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  final AboutController _aboutController =
      Get.put<AboutController>(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _aboutController.showLottie.value ? 0.0 : 1.0,
                duration: const Duration(seconds: 1),
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.cyan.shade700,
                  child: const Text(
                    "USA Pulse",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_aboutController.showLottie.value)
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Hero(
                      tag: "worldAnimation",
                      child: Lottie.asset(
                        'assets/world.json',
                        fit: BoxFit.cover,
                        repeat: true,
                        reverse: false,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
