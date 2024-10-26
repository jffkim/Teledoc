class Patient {
  final int id;
  final String name;
  final int age;
  final String medicalHistory;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.medicalHistory,
    });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      medicalHistory: json['medical_history'],
    );
  }
}
