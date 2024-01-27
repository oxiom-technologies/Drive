import 'dart:io';
import 'package:drive_/CONNECTION/connection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadPdfScreen extends StatefulWidget {
  @override
  _UploadPdfScreenState createState() => _UploadPdfScreenState();
}

class _UploadPdfScreenState extends State<UploadPdfScreen> {
  XFile? _selectedFile;
  TextEditingController _quizNameController = TextEditingController();

  Future<void> _selectFile() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedFile = pickedFile != null
          ? pickedFile
          : null;
    });
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      // Handle case where no file is selected
      return;
    }

    var pdf = await http.MultipartFile.fromPath("pdf", _selectedFile!.path!);

    var uri = Uri.parse("${Con.url}/upload.php");
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));
    var request = http.MultipartRequest("POST", uri);
    request.fields['quizName'] = _quizNameController.text;

    request.files.add(pdf);
    var resp = await request.send();

    if (resp.statusCode == 200) {
      print('star');
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select PDF'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _quizNameController,
              decoration: InputDecoration(labelText: 'Quiz Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
