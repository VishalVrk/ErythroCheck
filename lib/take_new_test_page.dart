import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TakeNewTestPage extends StatefulWidget {
  const TakeNewTestPage({super.key});

  @override
  State<TakeNewTestPage> createState() => _TakeNewTestPageState();
}

class _TakeNewTestPageState extends State<TakeNewTestPage> {
  final TextEditingController hemoglobinController = TextEditingController();
  final TextEditingController redController = TextEditingController();
  final TextEditingController irController = TextEditingController();

  bool isSaving = false;

  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref('health');
    _databaseReference.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          hemoglobinController.text = data['hemoglobin']?.toString() ?? '';
          redController.text = data['red_value']?.toString() ?? '';
          irController.text = data['ir_value']?.toString() ?? '';
        });
      }
    });
  }

  Future<void> saveTestData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in")),
      );
      return;
    }

    double? hemoglobin = double.tryParse(hemoglobinController.text);
    int? redValue = int.tryParse(redController.text);
    int? irValue = int.tryParse(irController.text);

    if (hemoglobin == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid hemoglobin value")),
      );
      return;
    }

    setState(() => isSaving = true);

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tests')
          .add({
        'hemoglobin': hemoglobin,
        'redValue': redValue ?? 0,
        'irValue': irValue ?? 0,
        'date': Timestamp.now(),
      });

      hemoglobinController.clear();
      redController.clear();
      irController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Test Saved Successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $e")),
      );
    }

    setState(() => isSaving = false);
  }

  @override
  void dispose() {
    hemoglobinController.dispose();
    redController.dispose();
    irController.dispose();
    // No need to cancel the listener, it's handled automatically.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Take New Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Enter Test Values",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: hemoglobinController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Hemoglobin (g/dL)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: redController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Red Value (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: irController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "IR Value (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isSaving ? null : saveTestData,
                child: isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Save Result"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}