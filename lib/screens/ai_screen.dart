import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({Key? key}) : super(key: key);

  @override
  _AiScreenState createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  bool _loading = true;
  File _image = File("path");
  List _outputs = [];
  final _imagePicker = ImagePicker();

  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  pickImage() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  // Classifiy the image selected
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output!;
      print(_outputs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Dog Breed Classifier',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: _loading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image == File('')
                          ? Container()
                          : Container(
                              child: Image.file(_image),
                              height: 500,
                              width: MediaQuery.of(context).size.width - 200,
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      _outputs.isNotEmpty
                          ? Text(
                              "${_outputs[0]["label"]}"
                                  .replaceAll(RegExp(r'[0-9]'), '')
                                  .split('-')[1],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  background: Paint()..color = Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text("Classification Waiting")
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: pickImage,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ));
  }
}
