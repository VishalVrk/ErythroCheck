import 'package:flutter/material.dart';
import 'theme.dart'; // Assuming your theme file is here

class DietaryPage extends StatelessWidget {
  const DietaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary Recommendations'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          RecommendationCard(
            title: 'For Low Hemoglobin',
            recommendations: [
              'Spinach and other leafy greens',
              'Lentils and beans',
              'Red meat (in moderation)',
              'Oranges and other vitamin C-rich fruits',
            ],
            icon: Icons.local_hospital,
            color: AppTheme.lowStatusColor,
          ),
          RecommendationCard(
            title: 'For Stable Hemoglobin',
            recommendations: [
              'Maintain a balanced diet',
              'Include a variety of fruits and vegetables',
              'Ensure adequate iron intake',
            ],
            icon: Icons.check_circle,
            color: AppTheme.stableStatusColor,
          ),
          RecommendationCard(
            title: 'For Improved Hemoglobin',
            recommendations: [
              'Continue your current diet',
              'Monitor your levels regularly',
              'Consult with a doctor for long-term plans',
            ],
            icon: Icons.star,
            color: AppTheme.improvedStatusColor,
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final String title;
  final List<String> recommendations;
  final IconData icon;
  final Color color;

  const RecommendationCard({
    super.key,
    required this.title,
    required this.recommendations,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            ...recommendations.map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_right,
                          size: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(text, style: theme.textTheme.bodyLarge)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
