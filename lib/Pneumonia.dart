import 'package:flutter/material.dart';
import 'dart:io';
import 'package:majorold/Output.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Pneumonia extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Pneumonia> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {
        // pass
      });
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Output(output: _output);
      }));
    });
  }

  loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
      model: 'assets/pnmodel.tflite',
      labels: 'assets/pnlabels.txt',
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(
      source: ImageSource.camera,
    );
    if (image == null)
      return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (image == null)
      return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(backgroundColor: Colors.lightBlueAccent[900], toolbarHeight: 45,),
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 40,
                  width: 400,

                  child: Center(
                    child: Text("PNEUMONIA DETECTOR", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,),),
                  ),
                ),
                SizedBox(height: 80),
                Center(child: _loading ? Container(
                    width: 200,
                    child: Column(children: <Widget>[
                      Image.asset('assets/select.png', cacheHeight: 200,
                        cacheWidth: 200,),
                      SizedBox(height: 80),
                    ],
                    )
                ) : Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: Image.file(_image),
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                )
                ),
                Container(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(top: 1.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                                '  ',
                                style: new TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  color: new Color(0xFF26C6DA),
                                )
                            ),
                            new Text(
                              '',
                              style: new TextStyle(
                                  fontSize: 35.0,
                                  fontFamily: 'Roboto',
                                  color: new Color(0xFF26C6DA)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () => pickImage(),
                        child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 100,
                            alignment: Alignment.center,
                            padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17,),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Take a photo", style: TextStyle(
                                color: Colors.white, fontSize: 16))
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => pickGalleryImage(),
                        child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 100,
                            alignment: Alignment.center,
                            padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17,),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Select from Gallery", style: TextStyle(
                                color: Colors.white, fontSize: 16))
                        ),
                      ),
                    ],
                    )
                ),
              ],
            )

        ),
      );

}