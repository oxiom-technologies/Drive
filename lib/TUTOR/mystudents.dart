
import 'package:drive_/TUTOR/mystudentAll.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';

class MyStudents extends StatefulWidget {
  const MyStudents({super.key});

  @override
  State<MyStudents> createState() => _MyStudentsState();
}

class _MyStudentsState extends State<MyStudents> {
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
        
       
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Students",style: TextStyle(fontSize: 18),),
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
                        text: 'New',
                        isSelected: selectedTabIndex == 1,
                        onTap: () => onTabSelected(1),
                      ),
                      TabBarItem(
                        text: 'Old',
                        isSelected: selectedTabIndex == 2,
                        onTap: () => onTabSelected(2),
                      ),
                    ],
                  ),
                ),
              ),
               Expanded(
                child: TabBarView(
                 physics:BouncingScrollPhysics(),
               
                  children: [
                    
                    if (selectedTabIndex == 0) MystudentsAll(),
                  
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

