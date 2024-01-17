
import 'package:drive_/ADMIN/newSession.dart';
import 'package:drive_/ADMIN/sessionAll.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';

class SessionsAdmin extends StatefulWidget {
  const SessionsAdmin({super.key});

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold( 
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right:15.0),
          child: SizedBox(height: 50,width: 50,
            child: FloatingActionButton(
            elevation: 1,
            onPressed: () {
                Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewSession()));
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
              ),
               Expanded(
                child: TabBarView(
                 physics:BouncingScrollPhysics(),
               
                  children: [
                    
                    if (selectedTabIndex == 0) SessionsALLAdmin(),
                  
                    if (selectedTabIndex == 1) SessionsALLAdmin(),
                    if (selectedTabIndex == 2) SessionsALLAdmin(),
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

