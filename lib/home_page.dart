import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/util/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text('Consistency is key'),
          centerTitle: false,
        ),
        body: Column(
          children: const [
            HabitTile(
              habitName: 'Exercise',
            ),
            HabitTile(
              habitName: 'Read',
            ),
            HabitTile(
              habitName: 'Code',
            ),
            HabitTile(
              habitName: 'Meditate',
            ),
          ],
        ));
  }
}
