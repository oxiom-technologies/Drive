import 'package:drive_/STUDENTS/mysessionAll.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';

class TrailAppointment extends StatefulWidget {
  const TrailAppointment({super.key});

  @override
  State<TrailAppointment> createState() => _TrailAppointmentState();
}


class _TrailAppointmentState extends State<TrailAppointment> {
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
                      'apply for trial'.toUpperCase(),
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
        body: Column(
          children: [
            Container(
              child: Row(
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
                    padding: EdgeInsets.only(left: 50, top: 40),
                    child: Text("Trail Appointments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ), Padding(
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
                   physics:BouncingScrollPhysics(),
                 
                    children: [
                      
                      if (selectedTabIndex == 0) MysessionsAll(),
                    
                      if (selectedTabIndex == 1) MysessionsAll(),
                      if (selectedTabIndex == 2) MysessionsAll(),
                    ],
                  ),
                ),
              ],
            ),
          
         
      ),
    );
  }
}
