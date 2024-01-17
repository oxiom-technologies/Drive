import 'package:flutter/material.dart';

class MyDocSKIP extends StatefulWidget {
  const MyDocSKIP({super.key});

  @override
  State<MyDocSKIP> createState() => _MyDocSKIPState();
}

class _MyDocSKIPState extends State<MyDocSKIP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(highlightElevation: 5,
            elevation: 1,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.black,
                    title: Center(
                        child: Text(
                      'Upload Documents'.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                minimumSize: const Size(256, 36),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  "Document Type",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                            ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical:5.0),
                               child: ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(256, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                                                         onPressed: () {},
                                                         child: const Row(
                                children: [
                                  Text(
                                    "Upload Image",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                                                         )
                                                         ),
                             ), ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(256, 36),
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {},
                            child: const Text(
                              "DONE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )
                            ),
                      ],
                    ),
                    
                  );
                },
              );
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
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
                  child: Text("My Documents",
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, indx) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://newsd.in/wp-content/uploads/2020/11/Aadhaar-PVC-card.jpg",
                              fit: BoxFit.cover,
                            )),
                        Container(
                          height: 50,
                          color: const Color.fromARGB(255, 233, 222, 213),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Aadhar Card",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.edit_document,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.delete_outline_sharp,
                                      size: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
