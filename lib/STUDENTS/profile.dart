import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  bottom: -60,
                  left: 30,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "images/profilepic.png",
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -60,
                  left: 130,
                  top: 120,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.sync,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 60,
                    child: Container(
                        width: 24,
                        height: 25,
                        child: Image.asset(
                          "images/img.png",
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                  right: 40,
                  top: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Anagelia Jackson",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Analyzer",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14)),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            "ChangeProfile",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Strong side :",
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
                          width: 84,
                          height: 30,
                          child: const Center(
                              child: Text(
                            "Analytics",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 243, 243),
                              borderRadius: BorderRadius.circular(8)),
                          width: 96,
                          height: 30,
                          child: const Center(
                              child: Text(
                            "Perfectionism",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 243, 243),
                              borderRadius: BorderRadius.circular(8)),
                          width: 84,
                          height: 30,
                          child: const Center(
                              child: Text(
                            "Analytics",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Text(
                          "  Your overall progress is ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 19),
                        ),
                        Text(
                          "60%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
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
                        "My Reports:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
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
                                  "My Performances",
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
                                  "My Tutor",
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
                                  "My Documents",
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
                                  "Refer My Friend",
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
