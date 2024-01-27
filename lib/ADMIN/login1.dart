// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:drive_/ADMIN/HomapageAdmin.dart';
import 'package:drive_/ADMIN/model%20AdminHome.dart';
import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/SHAREDPREFERENCES/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class LoginnAdmin extends StatefulWidget {
  var type;
  LoginnAdmin({super.key, required this.type});
  final _formkey = GlobalKey<FormState>();

  var visible = true;

  @override
  State<LoginnAdmin> createState() => _LoginnAdminState();
}

bool _isPasswordVisible = false;
var mail = TextEditingController();
var pass = TextEditingController();
TextEditingController _IDController = TextEditingController();
TextEditingController passcontrol = TextEditingController();

class _LoginnAdminState extends State<LoginnAdmin> {
  final formkey = GlobalKey<FormState>();

  Future<void> loginAdmin() async {
    var data = {
      'gen_ID': _IDController.text,
      'email': mail.text,
      'type': widget.type,
    };
    var response = await post(Uri.parse('${Con.url}/login.php'), body: data);
    print(response.body);
    print(jsonDecode(response.body));
    var user_id;
    user_id = jsonDecode(response.body)['log_id'];
    print('...........................................$user_id');
    SharedPreferencesHelper.saveData(user_id)
        .then((value) => print('SPsaved'))
        .catchError((e) {
      print('SP Not Saved $e');
    });

    if (jsonDecode(response.body)['result'] == 'User successfully login') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Login Successfully',
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
      ));
      if (widget.type == 'Admin') {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => const HomapageAdmin()), settings: RouteSettings()),
              (route) => false, // Removes all routes from the stack
            );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        content: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Invalid Credential',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        duration: const Duration(seconds: 3),
      ));
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => Loginn(type: widget.type)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20.0, top: 15),
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image(
                    image: AssetImage("images/sessionblack.png"),
                    height: 24,
                    width: 24,
                  )))
        ],
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Form(
          key: formkey,
          child: ListView(children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "ISS COLLEGE\nDRIVING SCHOOL",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                hintText: 'Enter Your mail',
                hintStyle: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w300),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter ID';
                } else if (value[0] != value[0].toUpperCase()) {
                  return 'First letter must be capitalized';
                }
                return null;
              },
              controller: _IDController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                hintText: 'Enter Your ID',
                hintStyle: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  loginAdmin();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    content: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Invalid Credential',
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
                  ));
                }
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
                "Login",
                style: (GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
