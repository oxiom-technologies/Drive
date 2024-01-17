import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StudProfile extends StatefulWidget {
  const StudProfile({super.key});

  @override
  State<StudProfile> createState() => _StudProfileState();
}

class _StudProfileState extends State<StudProfile> {
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
                    "Student",
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
                      child: Icon(
                        Icons.notifications,
                        size: 25,
                      ),
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
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage("images/profilepic.png"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Column(
                      children: [
                        Text(
                          "Zain Malik",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            "ID:PM00786",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                        ),
                        Text(
                          "Joined 02/04/2023",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          "  Your overall progress is ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                        Text(
                          "60%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                        "Sessions & Reveiw",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w400),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 44,
                                  width: 44,
                                  child: const Image(
                                    image:
                                        AssetImage("images/sessionblack.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  "Sessions",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Image(
                                    image: AssetImage("images/callblack.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Contact",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
