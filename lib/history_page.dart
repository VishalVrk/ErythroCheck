
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' hide Color;
import 'dart:math';
import 'theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = Random();
    final history = List.generate(10, (index) {
      final date = faker.date.dateTime(minYear: 2023, maxYear: 2024);
      final temp = (random.nextDouble() * 2 + 36).toStringAsFixed(1);
      final pulse = random.nextInt(20) + 70;
      final status = ['Stable', 'Low', 'Improved'][random.nextInt(3)];
      return {
        'date': date,
        'temp': temp,
        'pulse': pulse,
        'status': status,
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test History'),
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          Color statusColor;
          switch (item['status']) {
            case 'Stable':
              statusColor = AppTheme.stableStatusColor;
              break;
            case 'Low':
              statusColor = AppTheme.lowStatusColor;
              break;
            case 'Improved':
              statusColor = AppTheme.improvedStatusColor;
              break;
            default:
              statusColor = Colors.grey;
          }
          final date = item['date'] as DateTime;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: statusColor,
                child: Icon(
                  item['status'] == 'Low' ? Icons.arrow_downward : Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
              title: Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Temp: ${item['temp']}°C, Pulse: ${item['pulse']} BPM'),
              trailing: Text(
                item['status'].toString(),
                style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
