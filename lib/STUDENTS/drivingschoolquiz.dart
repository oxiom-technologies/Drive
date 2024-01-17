import 'dart:async';

import 'package:drive_/STUDENTS/driveqstns.dart';
import 'package:drive_/STUDENTS/drivingschool.dart';
import 'package:drive_/STUDENTS/quizbank.dart';
import 'package:flutter/material.dart';

class DrivingSchoolQuiz extends StatefulWidget {
  const DrivingSchoolQuiz({
    super.key,
  });

  @override
  State<DrivingSchoolQuiz> createState() => _DrivingSchoolQuizState();
}

class _DrivingSchoolQuizState extends State<DrivingSchoolQuiz> {
  int questionsNum = 0;
  String selectedOption = "";
  var result;
  var percentage;
  var wrongans;
  var attemptedQuest;

  Map<String, String> correctAnswers = {};
  Set<int> attemptedQuestions = {};
  Set<int> wrongAnswers = {};
  int timeLeft = 1800; // Set the initial time in seconds
  late Timer timer; // Declare a Timer variable
  Widget buildOptionButton(String option, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedOption == option
                  ? Color.fromRGBO(38, 52, 53, 1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: selectedOption == option ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    attemptedQuestions.add(questionsNum);
                    attemptedQuest = "${attemptedQuestions.length}";
                    print("attempted qstns:${attemptedQuestions.length}");
                    selectedOption = option;
                  });
                  checkAnswer(option);
                },
                child: Text(
                  questions[questionsNum]['options'][index],
                  style: TextStyle(
                    color:
                        selectedOption == option ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: selectedOption == option
                      ? Color.fromRGBO(38, 52, 53, 1)
                      : Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkAnswer(String selectedAnswer) {
    print(correctAnswers);
    print("correct ans: ${correctAnswers.length}");

    print("wrong ans: ${wrongAnswers.length}");
    setState(() {
      var correctAnswer = questions[questionsNum]['correctAnswer'];
      if (selectedAnswer == correctAnswer) {
        print("right");
        // Add the correct answer to the map
        correctAnswers[questions[questionsNum]['question']] = selectedAnswer;

        result = correctAnswers.length;
           percentage = (result / questions.length) * 100;

      } else {
        wrongAnswers.add(questionsNum);
        wrongans = wrongAnswers.length;

        print("wrong");
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        // Time is up, handle accordingly (e.g., show results, submit quiz)
        timer.cancel(); // Cancel the timer
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Color timeColor = timeLeft <= 300 ? Colors.red : Colors.black;
    int unattemptedCount = questions.length - attemptedQuestions.length;
    print(" unattempted:${unattemptedCount}==================");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
      body: Column(
        children: [
          SizedBox(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Driving school",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 26,
                        width: 76,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule_outlined,
                              size: 20,
                            ),
                            Text(
                              "  ${timeLeft ~/ 60} : ${timeLeft % 60}  ",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: DraggableScrollableSheet(
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 1,
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 4,
                          width: 50,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                // TabBar(
                                //   // padding:  EdgeInsets.symmetric(horizontal: 35.0),
                                //   tabAlignment: TabAlignment.start,
                                //   indicator: const BoxDecoration(
                                //     border: Border(
                                //       bottom: BorderSide(
                                //         color: Colors.black, // Indicator color
                                //         width: 2.0, // Indicator thickness
                                //       ),
                                //     ),
                                //   ),
                                //   labelColor:
                                //       Colors.white, // Selected tab text color
                                //   unselectedLabelColor:
                                //       Colors.white, // Unselected tab text color
                                //   isScrollable: true,
                                //   labelPadding: const EdgeInsets.symmetric(
                                //       horizontal: 5.0), // Padding for tab labels
                                //   tabs: tabs
                                //       .map(
                                //         (tab) => Tab(
                                //           child: Container(
                                //             height: 30,
                                //             width: 30,
                                //             decoration: BoxDecoration(
                                //               color: _currentIndex ==
                                //                       tabs.indexOf(tab)
                                //                   ? Colors
                                //                       .black // Grey color for selected tab
                                //                   : Colors.grey,
                                //               borderRadius: BorderRadius.circular(
                                //                   50.0), // Rounded corners
                                //               border: Border.all(
                                //                   color: Colors
                                //                       .transparent), // Divider color
                                //             ),
                                //             child: Center(
                                //               child: Text(
                                //                 tab,
                                //                 style: const TextStyle(
                                //                     fontSize: 16.0),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //       .toList(),
                                //   onTap: (index) {
                                //     setState(() {
                                //       _currentIndex = index;
                                //     });
                                //   },
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10.0),
                                //   child: Container(
                                //     height: 1, // Divider height below tabs
                                //     color:
                                //         Colors.grey, // Divider color below tabs
                                //   ),
                                // ),
                                Text(
                                  questions[questionsNum]['question'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                buildOptionButton('A.', 0),
                                SizedBox(height: 10),
                                buildOptionButton('B.', 1),
                                SizedBox(height: 10),
                                buildOptionButton('C.', 2),
                                SizedBox(height: 10),
                                buildOptionButton('D.', 3),

                                // Row(
                                //   children: [
                                //     Container(
                                //       width: 35,
                                //       height: 35,
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(50),
                                //           color: const Color.fromRGBO(
                                //               212, 212, 212, 1)),
                                //       child: const Center(
                                //           child: Text("E",
                                //               style: TextStyle(
                                //                   fontSize: 18,
                                //                   fontWeight: FontWeight.bold,
                                //                   color: Colors.white))),
                                //     ),
                                //     const SizedBox(
                                //       width: 20,
                                //     ),
                                //     const Expanded(
                                //       child: Text(
                                //         "Seat belt exemption",
                                //         style: TextStyle(fontSize: 15),
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (questionsNum > 0) {
                                      setState(() {
                                        questionsNum--;
                                        selectedOption =
                                            ""; // Reset selected option
                                      });
                                    }
                                  },
                                  child: questionsNum == 0
                                      ? Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_arrow_left,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_arrow_left,
                                            color: Colors.white,
                                          ),
                                        )),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => DrivingSchool(
                                          score: result,
                                          wrongAns: wrongans,
                                          attempted: attemptedQuest,
                                          unattempted: unattemptedCount,
                                          totelqstns: questions.length,
                                          percent: percentage,
                                          )));
                                },
                                child: const Text("submit Quiz"),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(195, 50),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    side: BorderSide(color: Colors.black)),
                              ),
                              InkWell(
                                  onTap: () {
                                    if (questionsNum < questions.length - 1) {
                                      setState(() {
                                        questionsNum++;
                                        selectedOption =
                                            ""; // Reset selected option
                                      });
                                    }
                                  },
                                  child: questionsNum == questions.length - 1
                                      ? Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                          ),
                                        )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
