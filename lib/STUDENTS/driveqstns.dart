import 'package:drive_/STUDENTS/quizbank.dart';
import 'package:flutter/material.dart';

class QestionSet1 extends StatefulWidget {
  const QestionSet1({super.key});

  @override
  State<QestionSet1> createState() => _QestionSet1State();
}

class _QestionSet1State extends State<QestionSet1> {
    int questionsNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
             Text(
              questions[questionsNum]['question'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),const SizedBox(height: 40,),
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  child: const Center(
                      child: Text("A",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),const SizedBox(width: 20,),
                const Expanded(
                  child: Text(
                    "Unrestricted practice",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
             Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  child: const Center(
                      child: Text("B",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),const SizedBox(width: 20,),
                const Expanded(
                  child: Text(
                    "Daytime driving only",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),  const SizedBox(height: 20,),
             Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  child: const Center(
                      child: Text("C",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),const SizedBox(width: 20,),
                const Expanded(
                  child: Text(
                    "Supervised learning",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
        const SizedBox(height: 20,),
             Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  child: const Center(
                      child: Text("D",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),const SizedBox(width: 20,),
                const Expanded(
                  child: Text(
                    "Immediate highway access",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
        const SizedBox(height: 20,),
             Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  child: const Center(
                      child: Text("E",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),const SizedBox(width: 20,),
                const Expanded(
                  child: Text(
                    "Seat belt exemption",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}
