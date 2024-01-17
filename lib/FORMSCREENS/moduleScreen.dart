import 'package:drive_/ADMIN/login1.dart';
import 'package:drive_/FORMSCREENS/login%20or%20register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Module extends StatefulWidget {
  const Module({super.key});

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginnAdmin(  type: 'Admin',)));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * .6, 50),
                  backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: Text(
                  "ADMIN",
                  style: (GoogleFonts.urbanist(
                      fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LogOrReg(
                          type: 'tutor',
                        )));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .6, 50),
                backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text(
                "TUTOR",
                style: (GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LogOrReg(
                        type: 'student',
                      )));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * .6, 50),
              backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: Text(
              "STUDENT",
              style: (GoogleFonts.urbanist(
                  fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
