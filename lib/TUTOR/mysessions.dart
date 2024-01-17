
import 'package:drive_/STUDENTS/mysessionAll.dart';
import 'package:drive_/TUTOR/mysessionAll%20Tutor.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';

class MysessionsTutor extends StatefulWidget {
  const MysessionsTutor({super.key});

  @override
  State<MysessionsTutor> createState() => _MysessionsTutorState();
}

class _MysessionsTutorState extends State<MysessionsTutor> {
  int selectedTabIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold( 
        
        floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(highlightElevation: 5,
            elevation: 1,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.black,
                    title: Center(
                        child: Text(
                      'apply for session'.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                minimumSize: const Size(256, 36),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  "Vehicle Type",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                            ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical:5.0),
                               child: ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(256, 36),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                                                         onPressed: () {},
                                                         child: const Row(
                                children: [
                                  Text(
                                    "Select Time & Date",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                                                         )
                                                         ),
                             ), ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(256, 36),
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {},
                            child: const Text(
                              "DONE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )
                            ),
                      ],
                    ),
                    
                  );
                },
              );
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Sessions"),
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
        body: SizedBox(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(185, 190, 190, 1),
                          borderRadius: BorderRadius.circular(8)),
                      width: 84,
                      height: 28,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Type"), Icon(Icons.expand_more)],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 51, 52, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TabBarItem(
                        text: 'All',
                        isSelected: selectedTabIndex == 0,
                        onTap: () => onTabSelected(0),
                      ),
                      TabBarItem(
                        text: 'Finished',
                        isSelected: selectedTabIndex == 1,
                        onTap: () => onTabSelected(1),
                      ),
                      TabBarItem(
                        text: 'Pending',
                        isSelected: selectedTabIndex == 2,
                        onTap: () => onTabSelected(2),
                      ),
                    ],
                  ),
                ),
              ), Expanded(
                child: TabBarView(
                 physics:const BouncingScrollPhysics(),
               
                  children: [
                    
                    if (selectedTabIndex == 0) const TutorMysessionsAll(),
                  
                    if (selectedTabIndex == 1) const TutorMysessionsAll(),
                    if (selectedTabIndex == 2) const TutorMysessionsAll(),
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}

