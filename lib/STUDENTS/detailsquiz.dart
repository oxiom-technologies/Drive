import 'package:drive_/STUDENTS/drivingschoolquiz.dart';
import 'package:flutter/material.dart';

class DetailQuiz extends StatefulWidget {
  const DetailQuiz({
    super.key,
  });

  @override
  State<DetailQuiz> createState() => _DetailQuizState();
}

class _DetailQuizState extends State<DetailQuiz> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text("Detail Quiz",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      ),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "Driving School Quiz",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "GET 100 Points",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0, top: 20),
                            child: Wrap(
                              spacing: 6,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 22,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    "4.8",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: DraggableScrollableSheet(controller: DraggableScrollableController(),
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 1,
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DrivingSchoolQuiz()));
                    },
                    child: Container(
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
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Brief explanation about this quiz",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.description_outlined,
                                            size: 20,
                                          ),
                                          foregroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "10 Question",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "10 Question for a correct answer",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.schedule,
                                            size: 20,
                                          ),
                                          foregroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1 hour 15 min",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "Total duration of the quiz",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.star_outline_outlined,
                                            size: 20,
                                          ),
                                          foregroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Win 10 star",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "Answer all questions correctly",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Please read the text below carefully so you can understand it",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "•",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "10 point awarded for a correct answer and no\n marks for a incorrect answer",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "•",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Tap on options to select the correct answer",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "•",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Tap on the bookmark icon to save interesting\n questions",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "•",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Click submit if you are sure you want to\n complete all the quizzes",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
