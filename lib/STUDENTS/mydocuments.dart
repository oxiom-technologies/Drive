import 'dart:convert';
import 'dart:io';

import 'package:drive_/CONNECTION/connection.dart';
import 'package:drive_/SHAREDPREFERENCES/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class MyDocuments extends StatefulWidget {
  const MyDocuments({super.key});

  @override
  State<MyDocuments> createState() => _MyDocumentsState();
}

class _MyDocumentsState extends State<MyDocuments> {
  var Lid;
  var flag = 0;
  var documentImg;
  var docName;
  var DocuId;
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {});
  }

  Future<void> deleteData() async {
    var data = {
      'doc_id': _globalDocID.toString(),
    };
    var response =
        await post(Uri.parse('${Con.url}/deleteMyDoc.php'), body: data);
    print("${response.body}==================");
    if (jsonDecode(response.body)['result'] == 'Success') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Deleted Successfully..')));
      setState(() {});
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete..')));
  }

  Future<List<Map<String, dynamic>>> viewDoc() async {
    // Your existing code to make the HTTP request and decode the response
    var data = {'uid': Lid.toString()};
    var response = await post(Uri.parse('${Con.url}/viewDoc.php'), body: data);

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(res);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> uploadDoc(File imageFile) async {
    var pic = await MultipartFile.fromPath("image", imageFile.path);

    var uri = Uri.parse("${Con.url}/uploaddoc.php");
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));
    var request = MultipartRequest("POST", uri);
    request.fields['user_id'] = Lid.toString();
    request.fields['name'] = doctypeController.text;

    request.files.add(pic);
    var resp = await request.send();
    if (resp.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Added Successfully',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop();
    } else {
      print('inside failed');
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        viewDoc();
        Lid = value;
        print('lid=$Lid===================');
      });
      print('lid=$Lid-------');
    });
  }

  TextEditingController _imgController = TextEditingController();
  TextEditingController doctypeController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imgController.text = _image!.path.split('/').last; // Display file name
      });

      // Do something with the selected image file
      print('Selected image path: ${pickedFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            highlightElevation: 5,
            elevation: 1,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.black,
                    title: Center(
                        child: Text(
                      'Upload Documents'.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 45,
                          child: TextFormField(
                            controller: doctypeController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.black)),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Document Type',
                              hintStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            child: TextFormField(
                              controller: _imgController,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Upload Image',
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              onTap: () async {
                                await _pickImage();
                              },
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(256, 36),
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              uploadDoc(_image!);
                            },
                            child: const Text(
                              "DONE",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            )),
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
      body: SingleChildScrollView(
        child: Column(
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
            FutureBuilder<List<Map<String, dynamic>>>(
              future: viewDoc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Display a loading indicator while waiting for data
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Data has been successfully loaded
                  List<Map<String, dynamic>> documents =
                      snapshot.data ?? []; // Use empty list if data is null

                  return Container(
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                        
                          var document = documents[index];
                          String docName = document['doc_name'];
                          String documentImg = document['document_img'];
                          String docID = document['doc_id'];
                          print("doc:${documents}**************");
                          print('Global Doc ID: ${_globalDocID}||||||||');
                          
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        "${Con.url}/doc/$documentImg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: const Color.fromARGB(
                                          255, 233, 222, 213),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              docName,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
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
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      
                                                      setGlobalDocID(docID);
                                                      printGlobalDocID();
                                                      //  _globalDocID;
                                                      // docID;
                                                      print(docName);

                                                      print(
                                                          "doc id:${docID}******");
                                                      deleteData();
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.delete_outline_sharp,
                                                    size: 20,
                                                  ),
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
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  String _globalDocID = ""; // Global variable

  void setGlobalDocID(String docID) {
    _globalDocID = docID;
  }

  void printGlobalDocID() {
    print('Global Doc ID: $_globalDocID');
  }
}
