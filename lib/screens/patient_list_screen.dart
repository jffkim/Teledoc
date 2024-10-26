import 'package:flutter/material.dart';
import '../models/patient_model.dart';
import '../services/patient_service.dart';
import 'patient_details_screen.dart';


class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final PatientService _patientService = PatientService();
  late Future<List<Patient>> _patientList;

  @override
  void initState() {
    super.initState();
    _patientList = _patientService.fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: FutureBuilder<List<Patient>>(
        future: _patientList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No patients found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final patient = snapshot.data![index];
                return ListTile(
                  title: Text(patient.name),
                  subtitle: Text('Age: ${patient.age}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailsScreen(patient: patient),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

