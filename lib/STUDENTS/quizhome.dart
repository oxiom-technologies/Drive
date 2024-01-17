import 'package:drive_/STUDENTS/beginartab.dart';
import 'package:drive_/STUDENTS/detailsquiz.dart';
import 'package:flutter/material.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({
    super.key,
  });

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
        body: Column(
          children: [
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.all(8.0),
                      child: Text("Hello,User",
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Lets test your knowledge",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black38,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromRGBO(255, 255, 255, 0.68),
                                    hintText: 'Search Services',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.filter_alt, color: Colors.white),
                          onPressed: () {
                            // Handle search button pressed here
                            // You can add your search functionality here
                          },
                        ),
                      ],
                    ),
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
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
                           const Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                                  child: TabBar(
                                    labelStyle: TextStyle(fontSize: 12),
                                    labelColor: Colors.black,
                                    tabAlignment: TabAlignment.center,
                                    indicatorColor: Colors.black,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorWeight: 1,
                                    indicatorPadding: EdgeInsets.all(10),
                                    unselectedLabelStyle:
                                        TextStyle(fontWeight: FontWeight.w300),
                                    tabs: [
                                      Tab(
                                        text: 'Beginner',
                                      ),
                                      Tab(text: 'Simple'),
                                      Tab(text: 'Medium'),
                                      Tab(text: 'Hard'),
                                    ],
                                  ),
                                ),
                                 Flexible(
                                    child: TabBarView(children: [
                                  Beginnertab(),
                                  Beginnertab(),
                                  Beginnertab(),
                                  Beginnertab(),
                                ])), 
                                
                              ],
                            ),
                          ),
                        
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width, 50),
                                           backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                                           foregroundColor: Colors.white,

                                        ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailQuiz()));
                                },
                                child: const Text("Start Quiz",style: TextStyle(fontSize: 16),),
                              ))
                        ],
                      ),
                     
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
