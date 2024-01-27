import 'package:drive_/ADMIN/Vehicle.dart';
import 'package:drive_/ADMIN/QuestionBank.dart';
import 'package:drive_/ADMIN/Quiz.dart';
import 'package:drive_/ADMIN/SendNotification.dart';
import 'package:drive_/ADMIN/Students.dart';
import 'package:drive_/ADMIN/Tutors.dart';
import 'package:drive_/ADMIN/model%20AdminHome.dart';
import 'package:drive_/ADMIN/profileAdmin.dart';
import 'package:drive_/ADMIN/qbank.dart';
import 'package:drive_/ADMIN/sessions.dart';
import 'package:drive_/STUDENTS/Trail%20Appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomapageAdmin extends StatefulWidget {
  const HomapageAdmin({super.key});

  @override
  State<HomapageAdmin> createState() => _HomapageAdminState();
}

class _HomapageAdminState extends State<HomapageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
             toolbarHeight: 200,
            expandedHeight: 200,
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
                    // ignore: prefer_const_constructors
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),

                    
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileAdmin())),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Perinthalmanna",
                            style: GoogleFonts.alegreya( fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,)
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ISS COLLEGE DRIVING SCHOOL",
                            style:GoogleFonts.alegreyaSans(  fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,)
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
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
            pinned: true,
            floating: false,
            
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  Students()));
                          break;
                        case 1:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Tutors()));
                          break;
                        case 2:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Vehicle()));
                          break;
                        case 3:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SessionsAdmin(type: 'admin',)));
                          break;
                        case 4:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TrailAppointment()));
                          break;
                        case 5:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  qbank()));
                          break;
                        case 6:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Quiz()));
                          break;
                        case 7:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SendNotification()));
                          break;
                      }
                    },
                    child: GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 249, 249, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 130,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                "${ADMINHome[index]["Image"]}",
                              ))),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${ADMINHome[index]["Name"]}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: ADMINHome.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
