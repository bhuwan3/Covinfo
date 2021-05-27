import 'package:covinfo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndiaScreen extends StatelessWidget {
  IndiaScreen({this.indiaData});
  final indiaData;
  static String id = "india_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: cardGradient,
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
                  "India Covid Stats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recovered: ${indiaData["recovered"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "New Recovered: ${indiaData["recoveredNew"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Deaths: ${indiaData["deaths"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "New Deaths: ${indiaData["deathsNew"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tests: ${indiaData["previousDayTests"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Total Cases: ${indiaData["totalCases"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Active: ${indiaData["activeCases"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "New Active: ${indiaData["activeCasesNew"]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Text(
                  "Last Updated: ${indiaData["lastUpdatedAtApify"].substring(0, 10)}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: indiaData["regionData"].length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: gradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${indiaData["regionData"][index]["region"]}",
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
                              "Active: ${indiaData["regionData"][index]["activeCases"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "New Infected: ${indiaData["regionData"][index]["newInfected"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Recovered: ${indiaData["regionData"][index]["recovered"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "New Recovered: ${indiaData["regionData"][index]["newRecovered"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Deceased: ${indiaData["regionData"][index]["deceased"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "New Deceased: ${indiaData["regionData"][index]["newDeceased"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Total Infected: ${indiaData["regionData"][index]["totalInfected"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
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
    );
  }
}
