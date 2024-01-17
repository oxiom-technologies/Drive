import 'package:flutter/material.dart';

class Questionbank extends StatefulWidget {
  const Questionbank({super.key});

  @override
  State<Questionbank> createState() => _QuestionbankState();
}

class _QuestionbankState extends State<Questionbank> {
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
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 224, 220, 217),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Question Bank ${index + 1}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                              height: 16,
                              width: 16,
                              child:
                                  Image(image: AssetImage("images/note.png"))),
                          Text(
                            " 10 Question",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                  const CircleAvatar(radius: 10,
                    child: Icon(Icons.arrow_forward,size: 12,),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          )),
        ],
      ),
    );
  }
}
