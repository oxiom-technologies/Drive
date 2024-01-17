import 'package:drive_/ADMIN/ALLsendnotification.dart';
import 'package:drive_/tabar/tabbaritem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendNotification extends StatefulWidget {
  const SendNotification({super.key});

  @override
  State<SendNotification> createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
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
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(automaticallyImplyLeading: false,
              toolbarHeight: 200,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
              flexibleSpace: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                               const SizedBox(height: 10,),

                       Card(
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
          const SizedBox(height: 10,),
                       Text(
                        "Send notifications",
                        style:GoogleFonts.alegreya(
                           fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )
                      ),
                     
                      const SizedBox(height: 10),
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
                                child: const TextField(
                                  minLines: 1,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    // Adjust the padding here
                                    fillColor:
                                        Color.fromRGBO(255, 255, 255, 0.68),
                                    hintText: 'Search Services',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
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
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(37, 51, 52, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TabBarItem(
                            text: 'All',
                            isSelected: selectedTabIndex == 0,
                            onTap: () => onTabSelected(0),
                          ),
                          TabBarItem(
                            text: 'Tutor',
                            isSelected: selectedTabIndex == 1,
                            onTap: () => onTabSelected(1),
                          ),
                          TabBarItem(
                            text: 'Student',
                            isSelected: selectedTabIndex == 2,
                            onTap: () => onTabSelected(2),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 1, // Change this to the number of items you have
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  if (selectedTabIndex == 0) const SendNotificationALL(),
                  if (selectedTabIndex == 1) const SendNotificationALL(),
                  if (selectedTabIndex == 2) const SendNotificationALL(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
