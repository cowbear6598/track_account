import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:track_account/pages/budget_page.dart';
import 'package:track_account/pages/stats_page.dart';
import 'package:track_account/theme/colors.dart';
import 'daily_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primary,
        child: const Icon(Icons.add, size: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DailyPage(),
        StatsPage(),
        BudgetPage(),
        Center(
          child: Text("Page 4"),
        )
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [Icons.date_range, Icons.account_balance, Icons.add_chart, Icons.access_alarm];

    return AnimatedBottomNavigationBar(
        icons: iconItems,
        iconSize: 25,
        height: 60,
        activeColor: primary,
        inactiveColor: grey,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        activeIndex: pageIndex,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        splashSpeedInMilliseconds: 200,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
