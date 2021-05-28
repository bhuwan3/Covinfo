import 'package:covinfo/authentication/presentation/screen/loading/loading_screen.dart';
import 'package:covinfo/constants.dart';
import 'package:covinfo/home/presentation/screen/beSafe/beSafe_screen.dart';
import 'package:covinfo/home/presentation/screen/india/india_screen.dart';
import 'package:covinfo/home/presentation/screen/news/news_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllCountryScreen extends StatefulWidget {
  AllCountryScreen({this.countryData, this.indiaData, this.newsData});
  final countryData;
  final indiaData;
  final newsData;
  static String id = "allCountry_screen";

  @override
  _AllCountryScreenState createState() => _AllCountryScreenState();
}

class _AllCountryScreenState extends State<AllCountryScreen> {
  int page = 0;

  final PageController controller = PageController(initialPage: 0);

  var duration = Duration(milliseconds: 500);

  Curve swipe = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return SystemNavigator.pop();
      },
      child: Scaffold(
        body: PageView(
            onPageChanged: (int) {
              setState(() {
                page = int;
              });
            },
            controller: controller,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: gradient,
                ),
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            "World Covid Stats",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () {
                              return Navigator.pushReplacementNamed(
                                  context, LoadingScreen.id);
                            },
                            child: ListView.builder(
                              itemCount: widget.countryData.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    gradient: cardGradient,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.countryData[index]["country"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Infected: ${widget.countryData[index]["infected"]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "Recovered: ${widget.countryData[index]["recovered"]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "Deceased: ${widget.countryData[index]["deceased"]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "Tested: ${widget.countryData[index]["tested"]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "Last updated: ${widget.countryData[index]["lastUpdatedApify"].substring(0, 10)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              IndiaScreen(
                indiaData: widget.indiaData,
              ),
              NewsScreen(
                newsData: widget.newsData,
              ),
              BeSafeScreen(),
            ]),
        bottomNavigationBar: Container(
          height: 80.0,
          color: Colors.black87,
          child: GNav(
            backgroundColor: Colors.black54,
            rippleColor: Colors.grey[500],
            hoverColor: Colors.grey,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.red.shade300,
            color: Colors.red.shade50,
            selectedIndex: page, // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.coronavirus_outlined,
                text: 'World',
              ),
              GButton(
                icon: Icons.home,
                text: 'India',
              ),
              GButton(
                icon: Icons.list_alt,
                text: 'News',
              ),
              GButton(
                icon: Icons.lightbulb,
                text: 'Be safe',
              )
            ],
            onTabChange: (int) {
              setState(() {
                page = int;
                controller.jumpToPage(int);
              });
            },
          ),
        ),
      ),
    );
  }
}
