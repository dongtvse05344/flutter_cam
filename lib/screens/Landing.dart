import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingScreens extends StatefulWidget {
  LandingScreens({Key key}) : super(key: key);

  _LandingScreensState createState() => _LandingScreensState();
}

class _LandingScreensState extends State<LandingScreens> {
  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();

  }
  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = picture;
    });

    Navigator.of(context).pop();
  }
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice:'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        _openGallery(context);
                      }),
                  SizedBox(height: 10,),
                  GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        _openCamera(context);
                      })
                ],
              ),
            ),
          );
        });
  }

  Widget _imageView() {
    if(imageFile ==null) {
      return Text('No image selected');
    }
    else {
      return Image.file(imageFile, width: 400, height: 400,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera access'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _imageView(),
            RaisedButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text('Select Image'),
            )
          ],
        ),
      ),
    );
  }
}
