//import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  //File _isImage;
  //List _isOutput;

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
  modelFn() async{
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
      ),
      // Add Floating Button at the bottom to select image from the gallery
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image)

      ),
    );
  }


}
