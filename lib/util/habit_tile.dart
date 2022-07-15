import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile({
    Key? key,
    required this.habitName,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  }) : super(key: key);

  // convert seconds into min:sec -> e.g. 62 seconds = 1:02 min
  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString(); // e.g. 62 % 60 = 2
    String mins = (totalSeconds / 60).toStringAsFixed(1);
    // 59 secons -> 0:59
    // ( 59 / 60 ).toStringAsFixed(1) -> 0.9... = 1

    // if secs is a 1 digit number, place a 0 infront of it
    if (secs.length == 1) {
      secs = '0$secs';
    }

    // if mins is a 1 digit number
    // 0.98 min -> 0 mins
    if (mins[1] == '.') {
      mins = mins.substring(0, 1);
    }
    return '$mins:$secs';
  }

  // calculate progress percentage
  double percentCompleted() {
    return timeSpent / (timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        // Progress circle
                        CircularPercentIndicator(
                          radius: 60,
                          //percent: 0.7,
                        ),
                        // Play pause button
                        Center(
                          child: Icon(
                              habitStarted ? Icons.pause : Icons.play_arrow),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // Habit
                  Text(
                    habitName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Progress
                  Text(
                    '${formatToMinSec(timeSpent)}/$timeGoal = ${(percentCompleted() * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ]),
              ]),
              GestureDetector(
                onTap: settingsTapped,
                child: const Icon(Icons.settings),
              ),
            ],
          )),
    );
  }
}
