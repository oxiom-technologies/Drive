import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  var studid;
  var tutorid;

    List<String> types = [
      'MCWG',
      'LMV',
      'HMV',
    ];

    String? _selectedType;

  Future<void> addSession() async {

    var data = {
      'stud_id': _selectedStudent.toString(),
      'tutor_id': selected_VehicleType.toString(),
      'date': dateController.text,
      'time': timeController.text,
      'type': _selectedType
    };
    print("${data}***********");
    var response =
        await post(Uri.parse('${Con.url}/addnewSession.php'), body: data);

    print(response.statusCode);

    var res = jsonDecode(response.body);

    if (res["result"] == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Added Successfully',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop(true);
    }
  }

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateTime _minDate = DateTime(2020, 1, 1);
  final DateTime _maxDate = DateTime(2080, 1, 1);
  DateTime selectedTime = DateTime.now();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = DateTime(
          selectedTime.year,
          selectedTime.month,
          selectedTime.day,
          picked.hour,
          picked.minute,
        );

        // Format time with AM/PM
        String formattedTime = DateFormat.jm().format(selectedTime);

        timeController.text = formattedTime;

        // Clear minute error if any
        // You can customize this part based on your specific validation criteria
        // For example, checking if the selected time is within a valid range
        if (selectedTime.minute % 5 != 0) {
          // Handle minute error as needed
          // For simplicity, let's round up to the nearest 5 minutes
          int roundedMinutes = ((selectedTime.minute / 5).round()) * 5;
          selectedTime = selectedTime
              .add(Duration(minutes: roundedMinutes - selectedTime.minute));
          timeController.text = DateFormat.jm().format(selectedTime);
        }
      });
    }
  }

  String? _selectedStudent;

  String? _selectedTutor;

  String? selected_VehicleType;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for the form

  var name_flag;
  var Liststud = [];
  Future<void> viewSt() async {
    var response = await post(Uri.parse('${Con.url}/viewnewSessionStud.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag = 1;
      var package = jsonDecode(response.body);
      print('*********************************************');
      print('stud is = $package');

      setState(() {
        Liststud = package
            .map((Liststud) => {
                  'id': Liststud['user_id'],
                  'name': Liststud['name'],
                })
            .toList();
      });
      print('*********************************************');

      print('stud is = $Liststud');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  var name_flag1;
  var ListTut = [];
  Future<void> viewTut() async {
    var response = await post(Uri.parse('${Con.url}/viewnewSessionTut.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag1 = 1;
      var tutors = jsonDecode(response.body);
      print('*********************************************');
      print('tutor is = $tutors');

      setState(() {
        ListTut = tutors
            .map((ListTut) => {
                  'id': ListTut['user_id'],
                  'name': ListTut['name'],
                })
            .toList();
      });
      print('*********************************************');

      print('Liststud is = $Liststud');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  @override
  void initState() {
    super.initState();
    viewSt();
    viewTut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // Wrap your content in a Form widget
        key: _formKey, // Assign the form key
        child: SingleChildScrollView(
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
                      const Text("New Session",
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
                  'Add New Session',
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
                  items: Liststud.map((student) {
                    studid = '${student['id']}';

                    return DropdownMenuItem<String>(
                      value: '$studid',
                      child: Text('${student['name']}'),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStudent = newValue;
                      print('{$_selectedStudent}=========');
                    });
                  },
                  decoration: InputDecoration(
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Select a student",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
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
                  items: ListTut.map((Tutor) {
                    tutorid = '${Tutor['id']}';
                    return DropdownMenuItem<String>(
                      value: '$tutorid',
                      child: Text('${Tutor['name']}'),
                    );
                  }).toList(),
                  onChanged: (String? newValuee) {
                    setState(() {
                      _selectedTutor = newValuee;
                    });
                  },
                  decoration: InputDecoration(
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Select Tutor",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
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
                  value: _selectedType,
                  items: types.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Select a vehicle type",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(232, 234, 236, 1),
                    hintText: 'Select Date',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a date';
                    }

                    final selectedDate = _dateFormat.parse(value);
                    if (selectedDate.isBefore(_minDate) ||
                        selectedDate.isAfter(_maxDate)) {
                      return 'Date must be between ${_dateFormat.format(_minDate)} and ${_dateFormat.format(_maxDate)}';
                    }

                    return null;
                  },
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: _minDate,
                      lastDate: _maxDate,
                    );

                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        dateController.text = _dateFormat.format(picked);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: timeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select Time',
                    filled: true,
                    fillColor: const Color.fromRGBO(232, 234, 236, 1),
                    suffixIcon: const Icon(Icons.timelapse),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () {
                    _showTimePicker(context);
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    addSession();
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 0.4),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: const Color.fromRGBO(37, 51, 52, 1),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
