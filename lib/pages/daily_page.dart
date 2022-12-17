import 'package:flutter/material.dart';
import 'package:track_account/widgets/day_select.dart';
import 'package:track_account/json/daily_json.dart';
import 'package:track_account/json/days_json.dart';
import 'package:track_account/theme/colors.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int currentDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [BoxShadow(color: grey.withOpacity(0.01), spreadRadius: 10, blurRadius: 3)]),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("每日花費", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black)), Icon(Icons.search)],
                  ),
                  SizedBox(height: 30),
                  DaySelectWidget(daysData: days)
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: List.generate(daily.length, (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 40) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(color: grey.withOpacity(0.1), shape: BoxShape.circle),
                                child: Center(child: Image.asset(daily[index]['icon'], width: 30, height: 30)),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: (size.width - 90) * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      daily[index]['name'],
                                      style: const TextStyle(fontSize: 15, color: black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      daily[index]['date'],
                                      style: const TextStyle(fontSize: 12, color: black, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: (size.width - 40) * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(daily[index]['price'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: green))],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, top: 8),
                      child: Divider(thickness: 0.8),
                    ),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 86),
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black.withOpacity(0.4)
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "\$1780.00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: black
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
