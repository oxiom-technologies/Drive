
import 'package:drive_/ADMIN/quizaddpage.dart';
import 'package:drive_/ADMIN/quizstatuspage.dart';
import 'package:flutter/material.dart';


class qbank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: Text('Manage Quiz',style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: Icon(Icons.arrow_back_ios_new),
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizAddPage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildQuizItem('Quiz 1', true,context),
            SizedBox(height: 20),
            _buildQuizItem('Quiz 2', true,context),
            SizedBox(height: 20),
            _buildQuizItem('Quiz 3', false,context),
            SizedBox(height: 20),
            // Add more quiz items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildQuizItem(String quizName, bool isActive,context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizStatusPage(),
          ),
        );
      },
      child: Container(
        width: 300,
        height: 80, // Increased height to accommodate the button
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    quizName,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.quiz, // Use the quiz icon here
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Action when the quiz icon is pressed
                    print('$quizName icon pressed');
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 16,
              child: Text(
                isActive ? 'Active' : 'Inactive',
                style: TextStyle(
                  color: isActive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
