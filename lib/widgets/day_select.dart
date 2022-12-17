import 'package:flutter/material.dart';
import 'package:track_account/models/days.dart';
import '../theme/colors.dart';

class DaySelectWidget extends StatefulWidget {
  final List<Days> daysData;

  const DaySelectWidget({required this.daysData, Key? key}) : super(key: key);

  @override
  State<DaySelectWidget> createState() => _DaySelectWidgetState();
}

class _DaySelectWidgetState extends State<DaySelectWidget> {
  int currentDayIndex = 0;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var days = widget.daysData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentDayIndex = index;
            });
          },
          child: Container(
            width: (size.width - 40) / 7,
            child: Column(
              children: [
                Center(child: Text(days[index].label, style: const TextStyle(fontSize: 10))),
                const SizedBox(height: 10),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: currentDayIndex == index ? primary : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: currentDayIndex == index ? primary : black.withOpacity(0.1))),
                  child: Center(
                      child: Text(days[index].day.toString(),
                          style: TextStyle(fontSize: 10, color: currentDayIndex == index ? white : black))),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
