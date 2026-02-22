import 'package:flutter/material.dart';

class TakeNewTestPage extends StatelessWidget {
  const TakeNewTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take New Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Place finger on sensor\nStay still for 30 seconds',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            const Text('Red Value: 580'),
            const Text('IR Value: 860'),
            const SizedBox(height: 16),
            const LinearProgressIndicator(value: 35 / 50),
            const SizedBox(height: 16),
            const Text('Calculating: 35 / 50', textAlign: TextAlign.center),
            const SizedBox(height: 32),
            const Text('H1 Value: 0.85',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Status: Stable',
                style: TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text('Save Result')),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
