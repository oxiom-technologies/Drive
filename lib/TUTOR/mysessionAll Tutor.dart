import 'package:flutter/material.dart';

class TutorMysessionsAll extends StatefulWidget {
  const TutorMysessionsAll({super.key});

  @override
  State<TutorMysessionsAll> createState() => _TutorMysessionsAllState();
}

class _TutorMysessionsAllState extends State<TutorMysessionsAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ListView.separated(
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("13-03-2023"),
                            Text("Sunday"),
                            Text("12:00 AM")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [                    
                                            const SizedBox(),

                              Row(
                                children: [

                                  Container(
                                    height: 33,
                                    width: 36,
                                   decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                                   child: const Icon(Icons.edit,color: Colors.white,size: 18,),
                                  ),
                                  Container(margin: const EdgeInsets.symmetric(horizontal: 5),
                                    height: 33,
                                    width: 36,
                                   decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                                   child: const Icon(Icons.close,color: Colors.white,size: 18,),
                                  ),
                                  Container(
                                    height: 33,
                                    width: 36,
                                     decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                                   child: const Icon(Icons.done_all,color: Colors.white,size: 18,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
