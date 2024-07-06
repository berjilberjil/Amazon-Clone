import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        _currentPageNotifier.value = _pageController.page!.round();
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'image': 'assets/fresh.png',
        'text': 'Fresh',
      },
      {
        'image': 'assets/prime.png',
        'text': 'Prime',
      },
      {
        'image': 'assets/mobile.png',
        'text': 'Mobile',
      },
      {
        'image': 'assets/fashion.png',
        'text': 'Fashion',
      },
      {
        'image': 'assets/tv.png',
        'text': 'TV',
      },
      {
        'image': 'assets/deals.png',
        'text': 'Deals',
      },
      {
        'image': 'assets/gadgets.png',
        'text': 'Gadgets',
      },
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 31, 225, 173),
              Color.fromRGBO(42, 181, 255, 1)
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove back button
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(0.0), // 5px padding
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 50.0, // Set the height of the search bar
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      elevation: 20,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 15), // Adjust the padding here
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          hintText: "Search Amazon.in",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Changed radius to 10
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, // added line
                            mainAxisSize: MainAxisSize.min, // added line
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  // Add your logic here
                                },
                                icon: const Icon(Icons.qr_code_scanner,
                                    color: Colors.grey),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Add your logic here
                                },
                                icon: const Icon(Icons.mic, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 0, 215, 219),
                            Color.fromARGB(255, 15, 248, 209),
                          ],
                        ),
                      ),
                      child: const Row(
                        // Add this
                        children: [
                          Padding(
                            // Add this
                            padding: EdgeInsets.only(
                                left: 10), // 5px padding to the left
                            child: Icon(
                              Icons.location_pin,
                              size: 25,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            // Add this
                            "Deliver to your address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 100,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = data[index % data.length];
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              item["image"],
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text(item['text']),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height:
                    300, // Increase the height to accommodate the CirclePageIndicator

                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPageNotifier.value = index;
                          });
                        },
                        itemCount: 4, // Number of pages
                        itemBuilder: (context, index) {
                          return AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            color: index == 0
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : index == 1
                                    ? Color.fromARGB(255, 255, 255, 255)
                                    : index == 2
                                        ? Color.fromARGB(255, 0, 148, 86)
                                        : Color.fromARGB(255, 187, 255, 0),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CirclePageIndicator(
                      dotColor: Colors.grey,
                      selectedDotColor: Colors.blue,
                      itemCount: 4, // Number of pages
                      currentPageNotifier: _currentPageNotifier,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
