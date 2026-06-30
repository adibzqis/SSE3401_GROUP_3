import 'package:flutter/material.dart';
import 'dart:async';
import 'package:section_8_plus/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 66, 192, 70), 
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.map_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'FSKTM NAVIGATOR',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 60),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 66, 192, 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}