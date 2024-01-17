import 'package:flutter/material.dart';

class AddNewTrial extends StatefulWidget {
  const AddNewTrial({super.key});

  @override
  State<AddNewTrial> createState() => _AddNewTrialState();
}

class _AddNewTrialState extends State<AddNewTrial> {
  String? _selectedStudent;

  List<String> _students = [
    'Student 1',
    'Student 2',
    'Student 3',
    // Add more _students as needed
  ];

  String? _selectedTutor;

  List<String> _Tutors = [
    'Tutor 1',
    'Tutor 2',
    'Tutor 3',
    // Add more Tutor as needed
  ];
  String? selected_VehicleType;

  List<String> _VehicleType = [
    '2 Whealer',
    '3 Whealer',
    '4 Whealer',
    // Add more _VehicleType as needed
  ];

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // Wrap your content in a Form widget
        key: _formKey, // Assign the form key
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                            )),
                      ),
                    ),
                    const Text("Trial Appointments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox()
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Add New Trial',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: const Color.fromRGBO(232, 234, 236, 1),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: _selectedStudent,
                items: _students.map((String student) {
                  return DropdownMenuItem<String>(
                    value: student,
                    child: Text(student),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedStudent = newValue;
                  });
                },
                decoration: InputDecoration(
                  // Optional: Add decoration for the form field
                  // labelText: 'Select a student', // Label text
                  hintText: "Select a student",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)), // Add a border
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: const Color.fromRGBO(232, 234, 236, 1),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: _selectedTutor,
                items: _Tutors.map((String _Tutor) {
                  return DropdownMenuItem<String>(
                    value: _Tutor,
                    child: Text(_Tutor),
                  );
                }).toList(),
                onChanged: (String? newValuee) {
                  setState(() {
                    _selectedStudent = newValuee;
                  });
                },
                decoration: InputDecoration(
                  // Optional: Add decoration for the form field
                  // labelText: 'Select a student', // Label text
                  hintText: "Select Tutor",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)), // Add a border
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(side: BorderSide(width: 0.4),
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromRGBO(232, 234, 236, 1),
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Select Time & Date",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: const Color.fromRGBO(232, 234, 236, 1),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: selected_VehicleType,
                items: _VehicleType.map((String _VehicleType) {
                  return DropdownMenuItem<String>(
                    value: _VehicleType,
                    child: Text(_VehicleType),
                  );
                }).toList(),
                onChanged: (String? newValue1) {
                  setState(() {
                    selected_VehicleType = newValue1;
                  });
                },
                decoration: InputDecoration(
                  // Optional: Add decoration for the form field
                  // labelText: 'Select a student', // Label text
                  hintText: "Vehicle type",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)), // Add a border
                ),
              ),
            ),  const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(side: BorderSide(width: 0.4),
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromRGBO(37, 51, 52, 1),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
