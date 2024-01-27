import 'dart:convert';

import 'package:drive_/ADMIN/AddStudent.dart';
import 'package:drive_/ADMIN/StudALL.dart'; // Import your StudALL widget
import 'package:drive_/ADMIN/UpdateStud.dart';
import 'package:drive_/ADMIN/sessions.dart';
import 'package:drive_/ADMIN/studNew.dart';
import 'package:drive_/ADMIN/studOLD.dart';
import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  // int selectedTabIndex = 0;

  // void onTabSelected(int index) {
  //   setState(() {
  //     selectedTabIndex = index;
  //   });
  // }

  bool loaded = false;
  List<Map<dynamic, dynamic>> students = [];
  List<Map<dynamic, dynamic>> filteredtudents = [];

  Future<void> loadAllStudents() async {
    setState(() {
      loaded = false;
    });
    var response = await get(
      Uri.parse('${Con.url}/viewStudAll.php'),
    );
    try {
      students = (jsonDecode(response.body) as List<dynamic>)
          .map((e) => e as Map<dynamic, dynamic>)
          .toList();
    } catch (e) {
      print(e);
    }
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadAllStudents();
    super.initState();
  }

  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    filteredtudents = students
        .where(
          (element) => element['name']
              .toString()
              .toLowerCase()
              .contains(searchTerm.toLowerCase()),
        )
        .toList();
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            highlightElevation: 5,
            elevation: 1,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddStud(
                        type: 'student',
                      )));
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              //       backgroundColor: Colors.black,
              //       title: Center(
              //           child: Text(
              //         'apply for session'.toUpperCase(),
              //         style:  TextStyle(color: Colors.white, fontSize: 14),
              //       )),
              //       content: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.white,
              //                   foregroundColor: Colors.black,
              //                   minimumSize:  Size(256, 36),
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(5))),
              //               onPressed: () {},
              //               child:  Row(
              //                 children: [
              //                   Text(
              //                     "Vehicle Type",
              //                     style: TextStyle(
              //                         fontSize: 14,
              //                         fontWeight: FontWeight.w300),
              //                   ),
              //                 ],
              //               )
              //               ),
              //                Padding(
              //                  padding:  EdgeInsets.symmetric(vertical:5.0),
              //                  child: ElevatedButton(
              //                                            style: ElevatedButton.styleFrom(
              //                     backgroundColor: Colors.white,
              //                     foregroundColor: Colors.black,
              //                     minimumSize:  Size(256, 36),
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(5))),
              //                                            onPressed: () {},
              //                                            child:  Row(
              //                   children: [
              //                     Text(
              //                       "Select Time & Date",
              //                       style: TextStyle(
              //                           fontSize: 14,
              //                           fontWeight: FontWeight.w300),
              //                     ),
              //                   ],
              //                                            )
              //                                            ),
              //                ), ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.black,
              //                   foregroundColor: Colors.white,
              //                   minimumSize:  Size(256, 36),
              //                   side:  BorderSide(color: Colors.white),
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(5))),
              //               onPressed: () {},
              //               child:  Text(
              //                 "DONE",
              //                 style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w300),
              //               )
              //               ),
              //         ],
              //       ),

              //     );
              //   },
              // );
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            backgroundColor: Color.fromRGBO(38, 52, 53, 1),
            flexibleSpace: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
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
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Students",
                        style: GoogleFonts.alegreya(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                minLines: 1,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  // Adjust the padding here
                                  fillColor:
                                      Color.fromRGBO(255, 255, 255, 0.68),
                                  hintText: 'Search Students',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (v) {
                                  setState(() {
                                    searchTerm = v;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            pinned: false,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 1,
                  (BuildContext context, int index) {
            return Column(children: [
              loaded
                  ? RefreshIndicator(
                      onRefresh: loadAllStudents,
                      child: ListView.separated(
                        controller: ScrollController(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        itemCount: filteredtudents.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 4,
                          child: Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                            // height: 100,
                            // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                            //   BoxShadow(
                            //       spreadRadius: 1,
                            //       blurRadius: 3,
                            //       blurStyle: BlurStyle.normal,
                            //       color: Colors.grey)
                            // ]),
                            child: ListTile(
                              trailing: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => UpdateStud(
                                                  uid: filteredtudents[index]
                                                      ['user_id'],
                                                ))),
                                    child: CircleAvatar(
                                      radius: 15,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 17,
                                      ),
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                  )),
                              contentPadding: EdgeInsets.only(top: 5, left: 20),
                              leading: Container(
                                height: 80,
                                width: 60,
                                child: Image.network(
                                  "${Con.url}/vehicles/${filteredtudents[index]['img']}",
                                  fit: BoxFit.fill,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      filteredtudents[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: Image(
                                              image: AssetImage(
                                                  "images/note.png"))),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SessionsAdmin(
                                                            type: 'user',
                                                            id: filteredtudents[
                                                                        index]
                                                                    ['user_id']
                                                                .toString())));
                                          },
                                          child: Text('View Sessions'))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.schedule,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        filteredtudents[index]['joineddate'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ]);
          }))
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Padding(
          //         padding:  EdgeInsets.all(15.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color:  Color.fromRGBO(37, 51, 52, 1),
          //             borderRadius: BorderRadius.circular(5),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               TabBarItem(
          //                 text: 'All',
          //                 isSelected: selectedTabIndex == 0,
          //                 onTap: () => onTabSelected(0),
          //               ),
          //               TabBarItem(
          //                 text: 'New',
          //                 isSelected: selectedTabIndex == 1,
          //                 onTap: () => onTabSelected(1),
          //               ),
          //               TabBarItem(
          //                 text: 'Old',
          //                 isSelected: selectedTabIndex == 2,
          //                 onTap: () => onTabSelected(2),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //     childCount: 1, // Change this to the number of items you have
          //   ),
          // ),
          // SliverFillRemaining(
          //   child: TabBarView(
          //     children: [
          //       if (selectedTabIndex == 0) StudALL(),
          //       if (selectedTabIndex == 1) StudNew(),
          //       if (selectedTabIndex == 2) StudOLD(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
