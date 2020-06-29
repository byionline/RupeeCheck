import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  //File _image;
  //List _output;

  // App will work offline so model needs to load first
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      _isLoading = true;
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
    );
  }
}
