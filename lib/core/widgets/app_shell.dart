import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartSchool Pro'),
      ),
      body: const Center(
        child: Text('App shell placeholder'),
      ),
    );
  }
}
