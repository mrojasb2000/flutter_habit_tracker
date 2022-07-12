import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  const HabitTile({Key? key, required this.habitName}) : super(key: key);

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
                Container(
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
                        child: Icon(Icons.play_arrow),
                      ),
                    ],
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
                  const Text(
                    '2:00 / 10 = 20%',
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
              ]),
              const Icon(Icons.settings),
            ],
          )),
    );
  }
}
