import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/Screens/First_Screen/first_Screen.dart';
import 'package:restaurant_app/core/utils/Appcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.primaryColors,
      body: Center(
        child: Lottie.asset(
          'assets/animation/Animation - 1745439717153.json',
          height: 500.h,
          width: 500.w,
        ),
      ),
    );
  }
}
