import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/SHAREDPREFERENCES/sharedPref.dart';
import 'package:drive_/STUDENTS/StudHome.dart';
import 'package:drive_/STUDENTS/modelstudHome.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DrivingSchool extends StatefulWidget {
  var score;
  var wrongAns;
  var attempted;
  var unattempted;
  var totelqstns;
  var percent;
  DrivingSchool(
      {super.key,
      required this.score,
      required this.wrongAns,
      required this.attempted,
      required this.unattempted,
      required this.totelqstns,
      required this.percent,

     
      });

  @override
  State<DrivingSchool> createState() => _DrivingSchoolState();
}

class _DrivingSchoolState extends State<DrivingSchool> {
  var Lid;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {  
        Lid = value;
        print('lid=$Lid');
         addQuizresult();
      });
  }
  );
  }
  Future<void> addQuizresult() async {
    var data = {
      'totel_question': widget.totelqstns.toString(),
      'score':   "${widget.score == null ? 0 : widget.score}",
      'correct_ans':  "${widget.score == null ? 0 : widget.score}",
      'wrong_ans': '${widget.wrongAns == null ? 0 : widget.wrongAns}',
      'completion': "${widget.percent==null?0 : widget.percent.toInt()}%",
      'user_id': Lid,
      
    };
    print("data :${data}");
    var response =
        await http.post(Uri.parse('${Con.url}/addQuizresult.php'), body: data);

    print(response.statusCode);

    var res = jsonDecode(response.body);}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * .5,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(38, 52, 53, 1),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0, left: 20),
                              child: Card(
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 40),
                              child: Text("Driving school",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 17)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0.192),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor:
                                const Color.fromARGB(90, 156, 160, 177),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Your Score",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        "  ${widget.score == null ? 0 : widget.score}",
                                        style: const TextStyle(
                                            fontSize: 28,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(" pt",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height:MediaQuery.of(context).size.height/2,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(29, 127, 169, 1),
                                  radius: 25,
                                  child: SizedBox(
                                      height: 21,
                                      width: 21,
                                      child: Image.asset(
                                        "images/restart.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Play Again",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(203, 151, 113, 1),
                                foregroundColor: Colors.white,
                                radius: 25,
                                child: Icon(Icons.visibility),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Review Answer",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(102, 128, 219, 1),
                                radius: 25,
                                child: Icon(Icons.share),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Share Score",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromRGBO(55, 175, 161, 1),
                                radius: 25,
                                child: SizedBox(
                                    height: 25,
                                    width: 18,
                                    child: Image.asset(
                                      "images/pdfimg.png",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Generate PDF",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomepagStud(
                                            skip: false,
                                          )));
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromRGBO(173, 138, 232, 1),
                                  foregroundColor: Colors.white,
                                  radius: 25,
                                  child: SizedBox(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset(
                                        "images/home.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "       Home       ",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(onTap: () {
                              },
                                child: CircleAvatar(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color.fromRGBO(95, 106, 110, 1),
                                  radius: 25,
                                  child: SizedBox(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset(
                                        "images/leaderboard.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Leaderboard",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.36,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              height: 159,
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "•",
                                style: TextStyle(fontSize: 52),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                 "${widget.percent==null?0 : widget.percent.toInt()}%",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text("Completion")
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "•",
                                style: TextStyle(fontSize: 55),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${widget.totelqstns == null ? 0 : widget.totelqstns}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Text("Totel Question")
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "•",
                                style: TextStyle(fontSize: 55),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${widget.score == null ? 0 : widget.score}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text("Correct")
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "•",
                                style: TextStyle(fontSize: 55),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${widget.wrongAns == null ? 0 : widget.wrongAns}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text("Wrong              ")
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
