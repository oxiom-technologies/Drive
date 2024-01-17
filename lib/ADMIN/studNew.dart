import 'dart:convert';

import 'package:drive_/ADMIN/UpdateStud.dart';
import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class StudNew extends StatefulWidget {
  const StudNew({super.key});

  @override
  State<StudNew> createState() => _StudNewState();
}

class _StudNewState extends State<StudNew> {

 int flag = 0;
  var res;
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  Future<dynamic> StudNew() async {
    var response = await get(
      Uri.parse('${Con.url}/viewStudNew.php'),
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
    StudNew();
    print('$res...............');
    

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(future: StudNew(),
             builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('ERROR: ${snapshot.error}');
                  }
                  if (!snapshot.hasData || snapshot.data.length == 0) {
                    print('no data');
                  } return flag == 1
                      ? RefreshIndicator(
                          onRefresh: _refresh,
                child: ListView.separated(controller:ScrollController(),shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    child: Container(decoration: BoxDecoration(border: Border.all(width: 1)),
                      height: 100,
                      // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      //   BoxShadow(
                      //       spreadRadius: 1,
                      //       blurRadius: 3,
                      //       blurStyle: BlurStyle.normal,
                      //       color: Colors.grey)
                      // ]),
                      child: ListTile(
                        trailing:  Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  UpdateStud(uid:snapshot.data[index]['user_id'],))),
                              child: const CircleAvatar(
                                radius: 15,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 17,
                                ),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                            )),
                        contentPadding: const EdgeInsets.only(top: 5, left: 20),
                        leading:Container(
                                      height: 80,
                                      width: 60,
                                      child: Image.network(
                                        "${Con.url}/vehicles/${snapshot.data[index]['img']}",
                                        fit: BoxFit.fill,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                        title:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                snapshot.data[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image(
                                        image: AssetImage("images/note.png"))),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    " 10 Sessions",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 16,
                                ),SizedBox(width: 5,),
                                Text(
                                  snapshot.data[index]['joineddate'],
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              ) : const Center(
                          child: CircularProgressIndicator(),
                        );
         } ),
         ) ],
        ),
      ),
    );
  }
}
