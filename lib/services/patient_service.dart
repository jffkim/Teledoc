import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/patient_model.dart';

class PatientService {
  static const String baseUrl = 'http://your-django-api-url/api/patients/';

  Future<List<Patient>> fetchPatients() async {
    try {
      final response =
          await http.get(Uri.parse('http://your-django-api-url/api/patients/'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((patient) => Patient.fromJson(patient)).toList();
      } else {
        throw Exception('Failed to load patients');
      }

      // Catch any unexpected errors, and rethrow a generic exception message
    } catch (e) {
      throw Exception('An unknown error occurred:$e');
    }
  }
}
