// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/FORMSCREENS/login1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Reg extends StatefulWidget {
  var type;
  Reg({super.key, required this.type});

  @override
  State<Reg> createState() => _RegState();
}

String? _selected;

List<String> _sex = [
  'Male',
  'Female',
  'Other',
  // Add more as needed
];

class _RegState extends State<Reg> {
  var name = TextEditingController();
  var age = TextEditingController();
  var sex = TextEditingController();
  var mail = TextEditingController();
  var phone = TextEditingController();

  final _namekey = GlobalKey<FormState>();
  final _ageKey = GlobalKey<FormState>();
  final _mailKey = GlobalKey<FormState>();
  final _numberKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  
    // final namekeyy = _namekey.currentState!.validate();
    // final agekeyy = _ageKey.currentState!.validate();
    // final mailkeyy = _mailKey.currentState!.validate();
    // final numberkeyy = _numberKey.currentState!.validate();

  Future<void> register() async {

    var data = {
      'name': name.text,
      'age': age.text,
      'sex': _selected.toString(),
      'email': mail.text,
      'phone': phone.text,
      'type': widget.type,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}/registration.php'), body: data);
    print(response.statusCode);
    print(response.body);
    var res = jsonDecode(response.body);

    if (res["result"] == 'Success'  ) {
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
                'Registered Successfully',
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
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Loginn(
                type: widget.type,
              )));
      name.clear();
      age.clear();
      sex.clear();
      mail.clear();
      phone.clear();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
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
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 81,
                        backgroundColor: Colors.white,
                      ),
                      widget.type == 'student'
                          ? const CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage("images/profilepic.png"),
                            )
                          : const CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage("images/profiletutor.png"),
                            ),
                      const Positioned(
                          right: 0,
                          top: 40,
                          child: CircleAvatar(
                            radius: 20,
                          )),
                      const Positioned(
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: const Color.fromRGBO(247, 248, 249, 1),
                        hintText: 'Enter Your Name',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Form(
                            key: _ageKey,
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
                               
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: const Color.fromRGBO(247, 248, 249, 1),
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
                            width: MediaQuery.of(context).size.width / 2,
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
                                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 17, horizontal: 10),
                                hintText: "Sex",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10)), // Add a border
                              ),
                              padding: EdgeInsets.only(
                                bottom: _ageKey.currentState?.validate() ?? true
                                    ? 0
                                    : 20,
                                left: 0,
                              ),
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
                  ElevatedButton(
                    onPressed: () {
                      if( _formKey.currentState!.validate()){
                      register();
            
                      }
                      print(name.text);
                      print(phone.text);
                      print(mail.text);
                      print(age.text);
                      print(_selected);
            
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
