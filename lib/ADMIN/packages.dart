import 'package:flutter/material.dart';

class PackagesADMIN extends StatefulWidget {
  const PackagesADMIN({super.key});

  @override
  State<PackagesADMIN> createState() => _PackagesADMINState();
}

class _PackagesADMINState extends State<PackagesADMIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20),
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
                const Padding(
                  padding: EdgeInsets.only(left: 50, top: 40),
                  child: Text("Packages",
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 13),
                  decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(38, 52, 53, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Package ${index + 1}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "   Voice messages anywhere",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "   Voice messages anywhere",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "   Voice messages anywhere",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                              Text(
                                "   Voice messages anywhere",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        
                        children: [
                          const Text(
                            "₹2999",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(114, 29),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                            child: const Text(
                              "Purchase Package",
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
