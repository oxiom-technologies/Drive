import 'package:drive_/FORMSCREENS/login1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogOrReg extends StatefulWidget {
  var type;
  LogOrReg({super.key, required this.type});

  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/drivelogoo.png"),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200.0, left: 90),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'D',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 50),
                              ),
                              TextSpan(
                                text: 'rivo',
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                  decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: ((context) => Loginn(
                                        type: widget.type,
                                      ))));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 50),
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
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("By continuing ,you agree to our",
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.w400)),
                    Text(
                      "Terms & Conditions",
                      style: GoogleFonts.urbanist(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        color: Color.fromRGBO(38, 52, 53, 1),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
