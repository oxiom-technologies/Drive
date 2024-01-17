// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/SHAREDPREFERENCES/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AddStud extends StatefulWidget {
  var type;
  AddStud({super.key, required this.type});

  @override
  State<AddStud> createState() => _AddStudState();
}

var selected_item1;

String? _selected;

List<String> _sex = [
  'Male',
  'Female',
  'Other',
  // Add more as needed
];

class _AddStudState extends State<AddStud> {
  var name = TextEditingController();
  var age = TextEditingController();
  var sex = TextEditingController();
  var mail = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  var dateController = TextEditingController();
  final TextEditingController _IDController = TextEditingController();

  void refreshRandomID() {
    setState(() {
      _IDController.text = RandomIDGenerator.generateRandomID();
    });
  }

  var Lid;
  final _formkey = GlobalKey<FormState>();
  // final _ageKey = GlobalKey<FormState>();
  // final _mailKey = GlobalKey<FormState>();
  // final _numberKey = GlobalKey<FormState>();
  // final _addressKey = GlobalKey<FormState>();
  // final _datekey = GlobalKey<FormState>();
  // final _vehicleKey = GlobalKey<FormState>();
  // final _sexKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateTime _minDate = DateTime(2020, 1, 1);
  final DateTime _maxDate = DateTime.now();

  Future<void> register() async {
    var data = {
      'name': name.text,
      'address': address.text,
      'age': age.text,
      'sex': _selected.toString(),
      'email': mail.text,
      'phone': phone.text,
      'joineddate': dateController.text,
      'vehicle': selected_item1.toString(),
      'gen_ID': _IDController.text,
      'type': widget.type,
      'AdminID': Lid.toString(),
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}/registration.php'), body: data);

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
      Navigator.of(context).pop();
      name.clear();
      address.clear();
      age.clear();
      sex.clear();
      mail.clear();
      phone.clear();
      dateController.clear();

      // if (jsonDecode(response.body)['result'] == 'Success') {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('Registered Successfully',style: TextStyle(color: Colors.red),)));
      //   Navigator.pop(context);
      // } else {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text('Registration Failed')));
      //   Navigator.pop(context);
      // }
    }
  }

  bool nameFieldEmpty = true;
  bool addressFieldEmpty = true;
  bool ageFieldEmpty = true;
  bool sexFieldEmpty = true;
  bool emailFieldEmpty = true;
  bool numberFieldEmpty = true;
  bool joinedFieldEmpty = true;

  var name_flag;
  var ListData = [];
  Future<void> viewPackage() async {
    var response = await post(Uri.parse('${Con.url}/viewpackage.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      name_flag = 1;
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

  @override
  void initState() {
    super.initState();
    viewPackage();
    _IDController.text = RandomIDGenerator.generateRandomID();
    // Set up listeners for text fields
    name.addListener(_updateNameFieldEmpty);
    address.addListener(_updateAddressFieldEmpty);
    age.addListener(_updateAgeFieldEmpty);
    sex.addListener(_updateSexFieldEmpty);
    mail.addListener(_updateEmailFieldEmpty);
    phone.addListener(_updateNumberFieldEmpty);
    dateController.addListener(_updateJoinedFieldEmpty);

    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        Lid = value;
        print('lid=$Lid');
      });
    });
  }

  void _updateNameFieldEmpty() {
    setState(() {
      nameFieldEmpty = name.text.isEmpty;
    });
  }

  void _updateAddressFieldEmpty() {
    setState(() {
      addressFieldEmpty = address.text.isEmpty;
    });
  }

  void _updateAgeFieldEmpty() {
    setState(() {
      ageFieldEmpty = age.text.isEmpty;
    });
  }

  void _updateSexFieldEmpty() {
    setState(() {
      sexFieldEmpty = sex.text.isEmpty;
    });
  }

  void _updateEmailFieldEmpty() {
    setState(() {
      emailFieldEmpty = mail.text.isEmpty;
    });
  }

  void _updateNumberFieldEmpty() {
    setState(() {
      numberFieldEmpty = phone.text.isEmpty;
    });
  }

  void _updateJoinedFieldEmpty() {
    setState(() {
      joinedFieldEmpty = dateController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    // Clean up the controllers and remove the listeners
    name.dispose();
    address.dispose();
    age.dispose();
    sex.dispose();
    mail.dispose();
    phone.dispose();

    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          leading: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Stack(
                    children: [
                      CircleAvatar(
                        radius: 81,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/profilepic.png"),
                      ),
                      Positioned(
                          right: 0,
                          top: 40,
                          child: CircleAvatar(
                            radius: 20,
                          )),
                      Positioned(
                          right: 0,
                          top: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              foregroundColor: Colors.white,
                              radius: 17,
                              backgroundColor: Color.fromRGBO(38, 52, 53, 1),
                              child: Icon(
                                Icons.edit,
                                size: 17,
                              ),
                            ),
                          ))
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'YOUR ID :-',
                            style: GoogleFonts.urbanist(
                                backgroundColor: Colors.amber,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.green),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.urbanist(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              readOnly: true,
                              controller: _IDController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
                                suffixIcon: IconButton(
                                  onPressed: refreshRandomID,
                                  icon: Icon(Icons.refresh),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'Name cannot contain special characters';
                        }
                        return null;
                      }

                      // Inside your form submission function, you can use the validateName function

                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      controller: address,
                      decoration: InputDecoration(
                        suffixIcon: addressFieldEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  address.clear();
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
                        hintText: 'Address',
                        hintStyle: GoogleFonts.urbanist(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Adress';
                        }
                        if (value.length < 5) {
                          return 'Address must be at least 5 characters long';
                        }
                        if (value.length > 50) {
                          return 'Address can be at most 50 characters long';
                        }
                        if (RegExp(r'[!@#\$%^&*?":{}|<>]').hasMatch(value)) {
                          return 'Address cannot contain special characters';
                        }
                        return null;
                      }

                      // Inside your form submission function, you can use the validateAddress function

                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width / 2,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your age';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Age must be a number';
                                }
                                int? age = int.tryParse(value);
                                if (age == null) {
                                  return 'Invalid age';
                                }
                                if (age < 10) {
                                  return 'Age must be greater than 10';
                                }
                                return null;
                              },
                              controller: age,
                              decoration: InputDecoration(
                                suffixIcon: ageFieldEmpty
                                    ? null
                                    : IconButton(
                                        onPressed: () {
                                          age.clear();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                      ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
                                hintText: 'Age',
                                hintStyle: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2)
                              ],
                              onChanged: (value) {
                                if (value.length == 10) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width / 2,
                            child: DropdownButtonFormField<String>(
                              borderRadius: BorderRadius.circular(20),
                              value: _selected,
                              items: _sex.map((String gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selected = newValue;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 10),
                                hintText: "Sex",
                                hintStyle: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10)), // Add a border
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a Gender';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                    controller: mail,
                    decoration: InputDecoration(
                      suffixIcon: emailFieldEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                mail.clear();
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
                      hintText: 'Mail',
                      hintStyle: GoogleFonts.urbanist(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Invalid phone number format';
                        }

                        return null;
                      },
                      controller: phone,
                      decoration: InputDecoration(
                        suffixIcon: numberFieldEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  phone.clear();
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
                        hintText: 'Phone Number',
                        hintStyle: GoogleFonts.urbanist(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    ),
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: joinedFieldEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                dateController.clear();
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
                      hintText: 'Joined Date',
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
                        initialDate: _selectedDate ?? _maxDate,
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
                  const SizedBox(
                    height: 20,
                  ),

                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a package';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    isExpanded: true,
                    hint: const Text(' Select Your vehicle'),
                    value: selected_item1,
                    items: ListData.map((VehicleType) => DropdownMenuItem(
                          value: '${VehicleType['name']}',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${VehicleType['name']}',
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                  Text(
                                    '${VehicleType['duration']}',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Rs.${VehicleType['price']}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )).toList(),
                    onChanged: (val) {
                      setState(() {
                        print("Selected value: $val");
                        print("Dropdown items: $ListData");
                        selected_item1 = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 248, 249, 1),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        register();
                        print(name.text);
                        print(address.text);
                        print(age.text);
                        print(_selected);
                        print(mail.text);
                        print(phone.text);
                        print(dateController.text);
                        print(selected_item1);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 90, vertical: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            content: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'invalid Credentials',
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
                          ),
                        );
                      }

                      //              switch(widget.type)
                      // {
                      //   case "student":  Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) =>  Loginn(type: widget.type,)));
                      //     break;
                      //     case "tutor":Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) =>  Loginn(type: widget.type,)));
                      //     break;
                      // }

                      // Process the name (e.g., save to a database, show a message)
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: (GoogleFonts.urbanist(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class RandomIDGenerator {
  static String generateRandomID() {
    Random random = Random();
    int randomNumber =
        random.nextInt(9000) + 1000; // Generate a 4-digit random number
    String randomID = 'St$randomNumber'; // Prefix "st" to the random number
    return randomID;
  }
}
