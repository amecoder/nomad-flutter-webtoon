import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  late Timer timer;
  bool isRunning = false;
  int totalPomodors = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodors = totalPomodors + 1;
        totalSeconds = twentyFiveMinutes;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onResetPressed() {
    if (totalSeconds < twentyFiveMinutes) {
      timer.cancel();
      setState(() {
        totalSeconds = twentyFiveMinutes;
        isRunning = false;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    // print(duration.toString().split('.').first.substring(2));
    return duration.toString().split('.').first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_outline_outlined
                            : Icons.play_circle_outline_outlined,
                      ),
                    ),
                    IconButton(
                      iconSize: 120,
                      onPressed: onResetPressed,
                      color: Theme.of(context).cardColor,
                      icon: const Icon(Icons.restore_outlined),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pomodors',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.color,
                                )),
                            Text('$totalPomodors',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.color,
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
