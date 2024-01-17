import 'package:flutter/material.dart';

class MysessionsAll extends StatefulWidget {
  const MysessionsAll({super.key});

  @override
  State<MysessionsAll> createState() => _MysessionsAllState();
}

class _MysessionsAllState extends State<MysessionsAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.white,
     
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child:ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                        height: 97,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(247, 243, 240, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("13-03-2023"),
                                  Text("Sunday"),
                                  Text("12:00 AM")
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                   Container(height: 15,width: 14,
                                    child: Image(image: AssetImage("images/img.png"),fit: BoxFit.cover,)),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white),
                                        onPressed: () {},
                                        child: const Text("Pending Session",style: TextStyle(fontSize: 12),))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),separatorBuilder: (context, index) => SizedBox(height: 20,),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
