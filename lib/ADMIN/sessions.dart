import 'dart:convert';

import 'package:drive_/ADMIN/newSession.dart';
import 'package:drive_/ADMIN/sessionAll.dart';
import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SessionsAdmin extends StatefulWidget {
  final String type;
  final String? id;
  const SessionsAdmin({super.key, required this.type, this.id});

  @override
  State<SessionsAdmin> createState() => _SessionsAdminState();
}

class _SessionsAdminState extends State<SessionsAdmin> {
  int selectedTabIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  bool loaded = false;
  List<Map<dynamic, dynamic>> sessions = [];

  Future<void> loadAllSessions() async {
    setState(() {
      loaded = false;
    });
    String endPoint = widget.type == 'admin'
        ? 'load_sessions.php'
        : widget.type == 'user'
            ? 'load_sessions_by_student.php?stud_id=${widget.id}'
            : 'load_sessions_by_tutor.php?tutor_id=${widget.id}';
    print(endPoint);
    var response = await get(
      Uri.parse('${Con.url}/$endPoint'),
    );
    try {
      sessions = (jsonDecode(response.body)['sessions'] as List<dynamic>)
          .map((e) => e as Map<dynamic, dynamic>)
          .toList();
    } catch (e) {
      print(e);
    }
    setState(() {
      loaded = true;
    });
  }

  List<String> types = [
    'MCWG',
    'LMV',
    'HMV',
  ];

  String? dropdownValue;

  @override
  void initState() {
    dropdownValue = types[0];
    // TODO: implement initState
    super.initState();
    loadAllSessions();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              elevation: 1,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewSession()))
                    .then((value) {
                  if (value != null && value) loadAllSessions();
                });
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                size: 32,
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        underline: Container(),
                        iconEnabledColor: Colors.white,
                        value: dropdownValue,
                        //dropdownColor: Color.fromARGB(255, 34, 34, 34),
                        focusColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        style: TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: types.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (selectedTabIndex == 0)
                      loaded
                          ? RefreshIndicator(
                              child: SessionsALLAdmin(
                                  sessions: sessions
                                      .where((element) =>
                                          element['type'] == dropdownValue)
                                      .toList()),
                              onRefresh: loadAllSessions,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    if (selectedTabIndex == 1)
                      loaded
                          ? RefreshIndicator(
                              child: SessionsALLAdmin(
                                sessions: sessions
                                    .where((element) =>
                                        element['status'] == 'finished' &&
                                        element['type'] == dropdownValue)
                                    .toList(),
                              ),
                              onRefresh: loadAllSessions,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    if (selectedTabIndex == 2)
                      loaded
                          ? RefreshIndicator(
                              child: SessionsALLAdmin(
                                sessions: sessions
                                    .where((element) =>
                                        element['status'] == 'pending' &&
                                        element['type'] == dropdownValue)
                                    .toList(),
                              ),
                              onRefresh: loadAllSessions,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
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
