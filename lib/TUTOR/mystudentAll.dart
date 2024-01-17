import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MystudentsAll extends StatefulWidget {
  const MystudentsAll({super.key});

  @override
  State<MystudentsAll> createState() => _MystudentsAllState();
}

class _MystudentsAllState extends State<MystudentsAll> {
  int flag = 0;
  var res;
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  Future<dynamic> Stud() async {
    var response = await get(
      Uri.parse('${Con.url}/viewStudAll.php'),
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
    Stud();

    print('$res...............');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: Stud(),
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
                          child: ListView.separated(shrinkWrap: true,controller: ScrollController(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.symmetric(horizontal: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 224, 220, 217),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                         snapshot.data[index]['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              height: 16,
                                              width: 16,
                                              child: Image(
                                                  image: AssetImage(
                                                      "images/note.png"))),
                                          Text(
                                            " 10 Question",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 12,
                                    ),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                          ),
                        )
                      : Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }
}
