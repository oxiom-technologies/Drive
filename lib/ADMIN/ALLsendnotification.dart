import 'package:flutter/material.dart';

class SendNotificationALL extends StatefulWidget {
  const SendNotificationALL({super.key});

  @override
  State<SendNotificationALL> createState() => _SendNotificationALLState();
}

class _SendNotificationALLState extends State<SendNotificationALL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                padding: EdgeInsets.all(0),
                itemCount: 2,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: Container(decoration: BoxDecoration(border: Border.all(width: 1)),
                    height: 100,
                    // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    //   BoxShadow(
                    //       spreadRadius: 1,
                    //       blurRadius: 3,
                    //       blurStyle: BlurStyle.normal,
                    //       color: Colors.grey)
                    // ]),
                    child: ListTile(
                      trailing: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 15,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 17,
                            ),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          )),
                      contentPadding: const EdgeInsets.only(top: 5, left: 20),
                      leading: Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              "Shibin Farhan",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 16,
                                  width: 16,
                                  child: const Image(
                                      image: AssetImage("images/note.png"))),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  " 10 Sessions",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 16,
                              ),
                              Text(
                                " 24-05-2023",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
