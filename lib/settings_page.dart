import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: const Text('Bluetooth Device Connect'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.clear),
            title: const Text('Clear History'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('App Theme'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Project'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
