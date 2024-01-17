import 'package:flutter/material.dart';

class Qbank extends StatefulWidget {
  const Qbank({super.key});

  @override
  State<Qbank> createState() => _QbankState();
}

class _QbankState extends State<Qbank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
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
                  const Text("Question Bank",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  const SizedBox()
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(37, 51, 52, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Upload New PDF  ",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Icon(
                      Icons.note_add_outlined,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(37, 51, 52, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create New PDF  ",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Icon(
                      Icons.note_add_outlined,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                mainAxisSpacing: 10.0, 
                crossAxisSpacing: 10.0,),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 249, 249, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 130,
                        width: 150,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 44,
                              width: 44,
                              child: Image(
                                image: AssetImage("images/sessionblack.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "  QB:00${index+1}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),),
            ),
          )
        ],
      ),
    );
  }
}
