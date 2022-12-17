import 'package:flutter/material.dart';
import 'package:track_account/theme/colors.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.5),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container();
  }
}
