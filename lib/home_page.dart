import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/util/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // overall habit summary
  List habitList = [
    // [ habitName, habitStarted, timeSpent (sec), timeGoal (min)]
    ['Exercise', false, 0, 10],
    ['Read', false, 0, 30],
    ['Writing', true, 0, 40],
    ['Meditate', false, 0, 15],
  ];

  void habitStarted(int index) {
    // habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    // keep the time going!
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        habitList[index][2]++;
      });
    });
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Settings for ' + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Consistency is key'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: ((context, index) {
          return HabitTile(
            habitName: habitList[index][0],
            onTap: () {
              habitStarted(index);
            },
            settingsTapped: () {
              settingsOpened(index);
            },
            habitStarted: habitList[index][1],
            timeSpent: habitList[index][2],
            timeGoal: habitList[index][3],
          );
        }),
      ),
    );
  }
}
