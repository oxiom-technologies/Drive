import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FourWhealer extends StatefulWidget {
  FourWhealer({super.key});
  @override
  State<FourWhealer> createState() => _FourWhealerState();
}

class _FourWhealerState extends State<FourWhealer> {
  int flag = 0;
  var res;
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  Future<dynamic> viewStudents() async {
    var response = await get(
      Uri.parse('${Con.url}/fourWhealer.php'),
    );
    print(response.body);
    print(response.statusCode);
    res = jsonDecode(response.body);
    //  print(res.length);
    if (res[0]['result'] == 'Success') {
      flag = 1;
    } else {
      flag = 0;
    }
    return res;
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
    viewStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: viewStudents(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('ERROR: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data.length == 0) {
                  print('no data');
                }
        
                return flag == 1
                    ? RefreshIndicator(
                        onRefresh: _refresh,
                        child: ListView.separated(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(31, 31, 17, 17)),
                                  borderRadius: BorderRadius.circular(15)),
        
                              // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                              //   BoxShadow(
                              //       spreadRadius: 1,
                              //       blurRadius: 3,
                              //       blurStyle: BlurStyle.normal,
                              //       color: Colors.grey)
                              // ]),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                contentPadding: const EdgeInsets.all(10),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data[index]['make'],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data[index]['model'],
                                        ),
                                      ],
                                    ), // Text(
                                    //   "Maruthi 800",
                                    //   style: TextStyle(
                                    //       fontSize: 16, fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data[index]['license_plate'],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // const Row(
                                    //   children: [
                                    //     Icon(Icons.star_outline),
                                    //     Text(
                                    //       "Tutor : Arun kumar",
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w300),
                                    //     ),
                                    //   ],
                                    // ),
                                    // const SizedBox(
                                    //   height: 5,
                                    // ),
                                    // const Row(
                                    //   children: [
                                    //     Icon(Icons.pin_drop_outlined),
                                    //     Text(
                                    //       "Branch : Perinthalmanna",
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w300),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                trailing: Container(
                                  height: 120,
                                  width: 145,
                                  child: Container(
                                    color: Colors.deepPurple,
                                    child: Image.network(
                                      "${Con.url}/vehicles/${snapshot.data[index]['img']}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
        
                                  // decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //   image: NetworkImage(
                                  //       "${Con.url}/vehicles/${snapshot.data[index]['img']}",),
                                  //   fit: BoxFit.cover,
                                  // )),
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
              )
            ]),
        ));
  }
}
