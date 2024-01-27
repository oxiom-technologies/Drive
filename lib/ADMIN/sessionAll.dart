import 'package:drive_/ADMIN/UpdateStud.dart';
import 'package:drive_/ADMIN/UpdateTutor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionsALLAdmin extends StatefulWidget {
  final List<Map<dynamic, dynamic>> sessions;

  const SessionsALLAdmin({super.key, required this.sessions});

  @override
  State<SessionsALLAdmin> createState() => _SessionsALLAdminState();
}

class _SessionsALLAdminState extends State<SessionsALLAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ListView.separated(
                itemCount: widget.sessions.length,
                itemBuilder: (context, index) {
                  DateTime sessionDateTime =
                      createDateTimeFromSessionData(widget.sessions[index]);
                  return Container(
                   // height: 97,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 243, 240, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat('dd-MM-yyyy')
                                  .format(sessionDateTime)),
                              Text(DateFormat('EEEE').format(sessionDateTime)),
                              Text(
                                  DateFormat('hh:mm a').format(sessionDateTime))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) => UpdateStud(
                                                        uid: widget.sessions[index]
                                                            ['student_id'],
                                                      )));
                                        },
                                        icon: Icon(Icons.person_pin_sharp),),
                                        IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) => UpdateTutor(
                                                        uid: widget.sessions[index]
                                                            ['tutor_id'],
                                                      )));
                                        },
                                        icon: Icon(Icons.person),),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: widget.sessions[index]
                                                    ['status'] ==
                                                'pending'
                                            ? Colors.red
                                            : Colors.teal,
                                        foregroundColor: Colors.white),
                                    onPressed: () {},
                                    child: Text(
                                      widget.sessions[index]['status'] ==
                                              'pending'
                                          ? 'Pending Session'
                                          : 'Finished Session',
                                      style: TextStyle(fontSize: 12),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DateTime createDateTimeFromSessionData(Map<dynamic, dynamic> sessionData) {
    String dateTimeStr = '${sessionData['date']} ${sessionData['time']}';
    return DateTime.parse(dateTimeStr).toLocal();
  }
}
