import 'package:flutter/material.dart';
// ignore: unused_import
import 'screens/patient_list_screen.dart';

void main() {
  runApp(const TeledocApp());
}

class TeledocApp extends StatelessWidget {
  const TeledocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teledoc App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PatientListScreen(),
    );
  }
}

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: Center(
        child: Text(
          'Patient List will appear here.',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
