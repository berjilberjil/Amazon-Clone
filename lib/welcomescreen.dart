import 'package:amazon_clone/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homescreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160, // Adjusted to move the logo 20px up
            child: Stack(
              children: [
                Positioned(
                  top: -60, // Moved 20px up
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/amazon.png',
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Sign in to your account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "View your wish list",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Find & reorder past purchases",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Track your purchases",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 45,
            width: 370,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: amazonBlack.withOpacity(0.1)),
                  ),
                ),
              ),
              child: const Text(
                "Already a customer? Sign in",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            width: 370,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(amazonLightGray),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black.withOpacity(0.1)),
                  ),
                ),
                elevation: MaterialStateProperty.all(1.0),
              ),
              child: const Text(
                "New to Amazon.in? Create an account",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            width: 370,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(amazonLightGray),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: amazonBlack.withOpacity(0.1)),
                  ),
                ),
                elevation: MaterialStateProperty.all(1.0),
              ),
              child: const Text(
                "Skip sign in",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
