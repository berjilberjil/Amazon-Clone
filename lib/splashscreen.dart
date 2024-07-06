import 'package:flutter/material.dart';
import 'homelanguagescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateTolang();
  }

  _navigateTolang() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LangPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'assets/amazon.png',
            height: 600,
          ),
        ),
      ),
    );
  }
}
