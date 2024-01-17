import 'package:drive_/TUTOR/mysessionAll%20Tutor.dart';
import 'package:drive_/TUTOR/mystudentAll.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';

class TutorMysessions extends StatefulWidget {
  const TutorMysessions({super.key});

  @override
  State<TutorMysessions> createState() => _TutorMysessionsState();
}

class _TutorMysessionsState extends State<TutorMysessions> {
  int selectedTabIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
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
              highlightElevation: 5,
              elevation: 1,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.black,
                      title: Center(
                          child: Text(
                        'Write Review'.toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      )),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                size: 35,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: 35,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: 35,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: 35,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: 35,
                                color: Colors.amber,
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
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
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    minimumSize: const Size(256, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Text(
                                      "Review",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(256, 36),
                                  side: const BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: const Text(
                                "SEND",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              )),
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
          title: const Text(
            "My Sessions",
            style: TextStyle(fontSize: 18),
          ),
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
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (selectedTabIndex == 0) TutorMysessionsAll(),
                    if (selectedTabIndex == 1) MystudentsAll(),
                    if (selectedTabIndex == 2) MystudentsAll(),
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
