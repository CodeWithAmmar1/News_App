import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/binding/dependency_binding.dart';
import 'package:newsapp/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.overlockScTextTheme()),
      debugShowCheckedModeBanner: false,
      initialBinding: DependendcyBinding(),
      home: Splash(),
    );
  }
}
