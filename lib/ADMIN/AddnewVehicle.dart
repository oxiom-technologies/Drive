import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/SHAREDPREFERENCES/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddnewVehicle extends StatefulWidget {
  const AddnewVehicle({super.key});

  @override
  State<AddnewVehicle> createState() => _AddnewVehicleState();
}

DateTime? _selectedDate;

bool nameFieldEmpty = true;
bool joinedFieldEmpty = true;
bool modelFieldEmpty = true;
bool LicenseFieldEmpty = true;

class _AddnewVehicleState extends State<AddnewVehicle> {
  var Lid;
  File? _image;
  Future _getImage() async {
    print('printed');
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  var name_flag2;
  var ListData = [];
  Future<void> viewPackage() async {
    var response = await post(Uri.parse('${Con.url}/viewpackage.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag2 = 1;
      var package = jsonDecode(response.body);
      print('*********************************************');
      print('package is = $package');

      setState(() {
        ListData = package
            .map((listItem) => {
                  'id': listItem['id'],
                  'name': listItem['pname'],
                  'price': listItem['price'],
                  'duration': listItem['duration'],
                })
            .toList();
      });
      print('*********************************************');

      print('ListData is = $ListData');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  Future<void> addVehicle(File imageFile) async {
    var pic = await MultipartFile.fromPath("image", imageFile.path);

    var uri = Uri.parse("${Con.url}/AddNewvehicle.php");
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));
    var request = MultipartRequest("POST", uri);
    request.fields['name'] = name.text;
    request.fields['model'] = _modelController.text;
    request.fields['licenseplate'] = _numplateController.text;
    request.fields['year'] = _yearController.text;
    request.fields['vehicletype'] = selected_VehicleType.toString();
    request.fields['AdminID'] = Lid.toString();
    request.files.add(pic);
    var resp = await request.send();
    if (resp.statusCode == 200) {
      print('star');
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
      Navigator.of(context).pop();
      name.clear();
      _modelController.clear();
      _numplateController.clear();
      _yearController.clear();
      _VehicleType.clear();
    } else {
      print('inside failed');
    }
  }

  int? _selectedYear;
  Future<void> _showYearPicker(BuildContext context) async {
    int initialYear = DateTime.now().year;
    int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select a Year'),
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              child: YearPicker(
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                selectedDate: DateTime(initialYear),
                onChanged: (DateTime dateTime) {
                  Navigator.of(context).pop(dateTime.year);
                },
              ),
            ),
          ],
        );
      },
    );

    if (selectedYear != null) {
      setState(() {
        _selectedYear = selectedYear;
        _yearController.text = selectedYear.toString();
        print('Selected year: $_selectedYear');
      });
    }
  }

  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _numplateController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();

  TextEditingController name = TextEditingController();
  @override
  void initState() {
    super.initState();
    viewPackage();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        Lid = value;
      });
    });
    print('lid=$Lid');

    // Set up listeners for text fields
    name.addListener(_updateNameFieldEmpty);
    _yearController.addListener(_updateJoinedFieldEmpty);
    _modelController.addListener(_updatemodelFieldEmpty);
    _numplateController.addListener(_updateLicensePlateFieldEmpty);
  }

  void _updateNameFieldEmpty() {
    setState(() {
      nameFieldEmpty = name.text.isEmpty;
    });
  }

  void _updatemodelFieldEmpty() {
    setState(() {
      modelFieldEmpty = _modelController.text.isEmpty;
    });
  }

  void _updateJoinedFieldEmpty() {
    setState(() {
      joinedFieldEmpty = _yearController.text.isEmpty;
    });
  }

  void _updateLicensePlateFieldEmpty() {
    setState(() {
      LicenseFieldEmpty = _numplateController.text.isEmpty;
    });
  }

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
  void dispose() {
    // Clean up the controllers and remove the listeners
    name.dispose();
    _modelController.dispose();
    _numplateController.dispose();
    _yearController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
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
                    const Text("Add New Vehicle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox()
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Add New Vehicle',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),
                Container(
                    child: _image == null
                        ? const Text('No image selected.')
                        : Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                          )),
                ElevatedButton(
                  onPressed: _getImage,
                  child: const Text('Select Image'),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      suffixIcon: nameFieldEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                name.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 248, 249, 1),
                      hintText: 'Name',
                      hintStyle: GoogleFonts.urbanist(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      if (value.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      if (value.length > 20) {
                        return 'Name can be at most 20 characters long';
                      }
                      if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Name cannot contain special characters';
                      }
                      return null;
                    }

                    // Inside your form submission function, you can use the validateName function

                    ),
                const SizedBox(height: 15.0),
                TextFormField(
                    controller: _modelController,
                    decoration: InputDecoration(
                      suffixIcon: modelFieldEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                _modelController.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 248, 249, 1),
                      hintText: 'Model',
                      hintStyle: GoogleFonts.urbanist(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Model';
                      }
                      if (value.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      if (value.length > 20) {
                        return 'Name can be at most 20 characters long';
                      }
                      if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Name cannot contain special characters';
                      }
                      return null;
                    }

                    // Inside your form submission function, you can use the validateName function

                    ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _numplateController,
                  decoration: InputDecoration(
                    suffixIcon: LicenseFieldEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _numplateController.clear();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'License_plate',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a License Plate Number';
                    }

                    // Define a regular expression to match a valid license plate format.
                    final RegExp plateRegExp = RegExp(r'^[a-zA-Z0-9]{1,10}$');

                    if (!plateRegExp.hasMatch(value)) {
                      return 'License Plate Number is not valid';
                    }

                    return null;
                  },

                  // Inside your form submission function, you can use the validateName function
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a year';
                    }

                    final int? year = int.tryParse(value);

                    if (year == null) {
                      return 'Invalid year format';
                    }

                    final int minYear =
                        2000; // Define your minimum allowable year
                    final int maxYear = DateTime.now()
                        .year; // Define your maximum allowable year

                    if (year < minYear || year > maxYear) {
                      return 'Year must be between $minYear and $maxYear';
                    }

                    return null;
                  },
                  controller: _yearController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    hintText: 'Select Year',
                    hintStyle: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w300),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showYearPicker(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 15.0),
                DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: selected_VehicleType,
                  items: ListData.map((VehicleType) {
                    return DropdownMenuItem<String>(
                      value:  '${VehicleType['name']}',
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${VehicleType['name']}',
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                '${VehicleType['duration']}',
                                style: const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                '${VehicleType['price']}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue1) {
                    setState(() {
                      selected_VehicleType = newValue1;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    // Optional: Add decoration for the form field
                    // labelText: 'Select a student', // Label text
                    hintText: "Vehicle type",
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // Add a border
                  ),
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addVehicle(_image!);
                    } else {
                      SnackBar(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        content: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Adding failed',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        duration: const Duration(seconds: 3),
                      );
                    }
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
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
