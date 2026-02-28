import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  String getStatus(double hb) {
    if (hb < 12) return "Low";
    if (hb > 17) return "High";
    return "Normal";
  }

  Color getStatusColor(double hb) {
    if (hb < 12) return Colors.red;
    if (hb > 17) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("User not logged in")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Test History")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('tests')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No tests yet"));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;

              double hb = (data['hemoglobin'] is num)
                  ? (data['hemoglobin'] as num).toDouble()
                  : 0;

              DateTime date = DateTime.now();
              if (data['date'] is Timestamp) {
                date = (data['date'] as Timestamp).toDate();
              }

              return ListTile(
                title: Text("Hemoglobin: ${hb.toStringAsFixed(1)} g/dL"),
                subtitle: Text("${date.day}/${date.month}/${date.year}"),
                trailing: Text(
                  getStatus(hb),
                  style: TextStyle(
                    color: getStatusColor(hb),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
