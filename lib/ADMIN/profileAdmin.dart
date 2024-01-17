import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({super.key});

  @override
  State<ProfileAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  // height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/curve.png"),
                          fit: BoxFit.cover)),
                  child: const Center(
                      child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                ),
            
               
                const Positioned(
                    right: 10,
                    top: 60,
                    child: SizedBox(
                        width: 24,
                        height: 25,
                        // child: Image.asset(
                        //   "images/img.png",
                        //   fit: BoxFit.cover,
                        // )
                        child: Icon(Icons.notifications,size: 25,),
                        )),
               
              ],
            ),
           Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Stack(
                        children: [
                          CircleAvatar(radius: 56,backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage:
                                  AssetImage("images/profileadmin.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Column(
                      children: [
                        Text(
                          "PM124524524",
                          style: TextStyle(
                               fontSize: 12),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            "Perinthalmanna Branch",
                             style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Text(
                          "ISS COLLEGE DRIVING SCHOOL",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     const Text(
                            "Contact",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            spacing: 10,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 231, 243, 243),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 82,
                                height: 30,
                                child: const Center(
                                    child: Text(
                                  "Head Office",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 231, 243, 243),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 82,
                                height: 30,
                                child: const Center(
                                    child: Text(
                                  "Manager",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                                )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 231, 243, 243),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 82,
                                height: 30,
                                child: const Center(
                                    child: Text(
                                  "Kottakkal",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                                )),
                              ),
                            ],
                          ),
SizedBox(height: 25,),


                    
                    const Row(
                      children: [
                        Text(
                          "  Your overall progress is ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17),
                        ),
                        Text(
                          "60%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      lineHeight: 6.0,
                      percent: 0.5,
                      barRadius: const Radius.circular(20),
                      backgroundColor: const Color.fromARGB(200, 238, 234, 234),
                      progressColor: Colors.black,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 15),
                      child: Text(
                        "More...",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                245,
                                249,
                                249,
                                1,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          height: 130,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 16,
                                    width: 16,
                                    child: const Image(
                                      image:
                                          AssetImage("images/personicon.png"),
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Total Students",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Some short description \nof this type of report.",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                245,
                                249,
                                249,
                                1,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          height: 130,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 16,
                                    width: 16,
                                    child: const Image(
                                      image: AssetImage("images/mytutor.png"),
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Total Tutors",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Some short description \nof this type of report.",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                245,
                                249,
                                249,
                                1,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          height: 130,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 16,
                                    width: 16,
                                    child: const Image(
                                      image:
                                          AssetImage("images/mydocuments.png"),
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Students Refer List",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Some short description \nof this type of report.",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                245,
                                249,
                                249,
                                1,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          height: 130,
                          width: 150,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    child: Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 20,
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Help",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Some short description \nof this type of report.",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
