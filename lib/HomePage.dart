import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  File _isImage;
  List _isOutput;

  // App will work offline so model needs to load first
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    // Call the function to load Machine Learning model from assets directory
    modelFn().then((value) {
      setState(() {
        // When tflite model gets loaded CircularProgress stops
        _isLoading = false;
      });
    });
  }

  // Function to load Machine Learning model (tflite) in this case
  // async & await is used for future task operations
  modelFn() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt"
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rupee Check"),
        backgroundColor: Colors.blueAccent,
      ),
      // Loading CircularProgress
      body: _isLoading ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ) : Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isImage == null ? Container() : Image.file(_isImage),
              SizedBox(
                height: 20,
              ),
              _isOutput != null
                  ? Text(
                "${_isOutput[0]["label"]}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  background: Paint()..color = Colors.white,
                ),
              )
                  : Container()
            ],
          )
      ),
      // Add Floating Button at the bottom to select image from the gallery
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        // Call to selectImage()
        onPressed: selectImage,
      ),
    );
  }


  // Select Image From Gallery Function Called when FloatingActionButton is pressed
  selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _isLoading = true;
      _isImage = image;
    });
    // Call to classifyImage(image)
    classifyImage(image);
  }

  // Selected Image From Gallery is Classified and store output
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,  // 3 types of image classification
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _isLoading = false;
      _isOutput = output;
    });
  }
}