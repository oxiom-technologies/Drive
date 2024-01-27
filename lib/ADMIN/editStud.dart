import 'dart:convert';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Editstud extends StatefulWidget {
  var name, address, age, gender, date, number, uid, vehicle;

  Editstud(
      {super.key,
      required this.uid,
      required this.name,
      required this.address,
      required this.age,
      required this.date,
      required this.gender,
      required this.number,
      required this.vehicle});

  @override
  State<Editstud> createState() => _EditstudState();
}

class _EditstudState extends State<Editstud> {
  List<String> types = [
    'MCWG',
    'LMV',
    'HMV',
  ];
  List<String> selectedTypes = [];
  Future<void> editStudent() async {
    var data = {
      'uid': widget.uid,
      'name': widget.name.text,
      'address': widget.address.text,
      'age': widget.age.text,
      'date': widget.date.text,
      'gender': widget.gender.text,
      'number': widget.number.text,
      'vehicle': selectedTypes.join(', ')
    };
    print("${data}*********************");
    var response = await post(Uri.parse('${Con.url}/editstud.php'), body: data);
    print(response.body);
    print(response.statusCode);
    var res = jsonDecode(response.body);
    if (res['result'] == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Details updated Successfully...')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update details...')));
    }
  }

  @override
  void initState() {
    super.initState();
    selectedTypes = widget.vehicle;
    setState(() {
      widget.name;
      widget.address;
      widget.age;
      widget.gender;
      widget.date;
      widget.number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show discard confirmation dialog
        showDiscardConfirmationDialog();

        // Return false to prevent the screen from being popped immediately
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: widget.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                ),
                keyboardType: TextInputType.name,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextFormField(
                          controller: widget.age,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextFormField(
                          controller: widget.gender,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextFormField(
                          controller: widget.date,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromRGBO(247, 248, 249, 1),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: widget.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                ),
                keyboardType: TextInputType.name,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: types.length,
                itemBuilder: (context, index) {
                  String type = types[index];
                  bool isSelected = selectedTypes.contains(type);

                  return ListTile(
                    title: Text(type),
                    tileColor: isSelected ? Colors.blue : null,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedTypes.remove(type);
                        } else {
                          selectedTypes.add(type);
                        }
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  editStudent();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDiscardConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Discard Changes?'),
          content: Text('Are you sure you want to discard changes?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the discard dialog
                Navigator.of(context).pop(); // Close the edit screen
              },
              child: Text('Discard'),
            ),
          ],
        );
      },
    );
  }
}
