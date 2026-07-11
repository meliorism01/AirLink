import 'package:flutter/material.dart';
import 'theme.dart';
import '../features/home/home_screen.dart';

class AirLinkApp extends StatelessWidget {
  const AirLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AirLink',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}

class SplashPlaceholder extends StatelessWidget {
  const SplashPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.air,
              size: 90,
              color: Colors.cyan,
            ),
            SizedBox(height: 24),
            Text(
              "AirLink",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Universal Smart IR Controller",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}