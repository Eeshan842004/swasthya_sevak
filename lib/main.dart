import 'package:flutter/material.dart';
import 'asha_login.dart';
import 'hello_asha.dart';
import 'ai_talk.dart';

void main() {
  runApp(const SwasthyaSevakApp());
}

class SwasthyaSevakApp extends StatelessWidget {
  const SwasthyaSevakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swasthya Sevak',
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFFCF9F7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SwasthyaHomeScreen(),
        '/login': (context) => const AshaLoginScreen(),
        '/helloAsha': (context) => const HelloAshaScreen(),
        '/aiTalk': (context) => const AiTalkPage(),
      },
    );
  }
}

class SwasthyaHomeScreen extends StatelessWidget {
  const SwasthyaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F7),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Logo without circle - pura logo dikhega
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                // Title
                const Text(
                  'SWASTHYA SEVAK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1C110C),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'आपका स्वास्थ्य साथी, अब AI के साथ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 60),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: const Size.fromHeight(52),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'शुरू करें',
                      style: TextStyle(
                        color: Color(0xFFFCF9F7),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}