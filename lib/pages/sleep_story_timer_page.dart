import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/utils/colors.dart';

class SleepStoryTimerPage extends StatefulWidget {
  final SleepContent sleepContent;

  const SleepStoryTimerPage({
    super.key,
    required this.sleepContent,
  });

  @override
  _SleepStoryTimerPageState createState() => _SleepStoryTimerPageState();
}

class _SleepStoryTimerPageState extends State<SleepStoryTimerPage> {
  Timer? _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime =
        widget.sleepContent.duration * 60; // convert minutes to seconds
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime =
          widget.sleepContent.duration * 60; // reset to initial duration
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Story Timer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sleepContent.category,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.sleepContent.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Duration: ${widget.sleepContent.duration} minutes',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.sleepContent.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Center(
              child: Text(
                _formatTime(_remainingTime),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isRunning ? _pauseTimer() : _startTimer();
                    });
                  },
                  child: Text(
                    _isRunning
                        ? 'Pause'
                        : (_remainingTime < widget.sleepContent.duration * 60
                            ? 'Resume'
                            : 'Start'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
