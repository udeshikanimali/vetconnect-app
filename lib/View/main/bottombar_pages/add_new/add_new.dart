import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../font_styles.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Post'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: 'Enter your post text...',
                  hintStyle: TextStyle(
                      color: Colors.green, fontSize: screenWidth * 0.015 + 10),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
                maxLines: 5,
              ),
              _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      height: 200,
                    )
                  : Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 220, 214, 214)),
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: const Text(
                      'Pick Image from Gallery',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: const Text(
                      'Take Photo',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              // _imageFile != null
              //     ? Text(
              //         'Image Selected: ${_imageFile!.path}',
              //         textAlign: TextAlign.center,
              //       )
              //     : Container(),
              SizedBox(height: screenHeight * 0.06),

              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // Implement post submission logic here
                    // Access _imageFile and post text for submission
                    if (_imageFile != null) {
                      print('Posting with image: ${_imageFile!.path}');
                    } else {
                      print('Posting without image');
                    }
                  },
                  child: Text(
                    'Add Post',
                    style: FontStyles.buttonTextStyle(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
