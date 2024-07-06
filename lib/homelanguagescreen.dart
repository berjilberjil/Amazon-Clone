import 'package:amazon_clone/utilities.dart';
import 'package:flutter/material.dart';
import 'welcomescreen.dart';

class LangPage extends StatefulWidget {
  const LangPage({super.key});

  @override
  _langPageState createState() => _langPageState();
}

class _langPageState extends State<LangPage> {
  String selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    // List of languages
    final List<String> languages = [
      'English',
      'Spanish',
      'French',
      'German',
      'Italian',
      'Portuguese',
      'Russian',
      'Chinese',
    ];

    // List of colors
    final List<Color> colors = [
      Colors.red[100]!,
      Colors.orange[100]!,
      Colors.yellow[100]!,
      Colors.green[100]!,
      Colors.blue[100]!,
      Colors.indigo[100]!,
      Colors.purple[100]!,
      Colors.pink[100]!,
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(Icons.language),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Choose your language",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                // Use Expanded instead of SizedBox
                child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 1.5, // Set your desired aspect ratio
                  children: List.generate(languages.length, (index) {
                    // ... other code

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = languages[index];
                        });
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Transform.scale(
                            scale: selectedLanguage == languages[index]
                                ? 1.1
                                : 1.0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 30),
                              decoration: BoxDecoration(
                                color: selectedLanguage == languages[index]
                                    ? const Color.fromARGB(121, 167, 251,
                                        255) // Set color to blue accent when selected
                                    : colors[index %
                                        colors
                                            .length], // Use index to select a color
                                borderRadius: BorderRadius.circular(10),
                                border: selectedLanguage == languages[index]
                                    ? Border.all(
                                        color: const Color.fromARGB(
                                            255,
                                            41,
                                            241,
                                            255), // Border color same as tick mark
                                        width: 2.0, // Border width
                                      )
                                    : null, // No border when not selected
                              ),
                              margin: const EdgeInsets.all(10),
                              child: Center(
                                  child: Text(languages[index],
                                      style: const TextStyle(fontSize: 18))),
                            ),
                          ),
                          if (selectedLanguage == languages[index])
                            const Positioned(
                              top: 8.0,
                              right: 8.0,
                              child: CircleAvatar(
                                radius:
                                    10, // Smaller radius for smaller tick mark
                                backgroundColor: Color.fromARGB(255, 28, 176,
                                    187), // Darker shade of blue accent
                                child: Icon(Icons.check,
                                    color: Colors.white,
                                    size: 15), // Smaller icon size
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 280,
            left: 0,
            right: 0,
            child: Visibility(
              visible: selectedLanguage.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: amazonOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Continue in $selectedLanguage',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
