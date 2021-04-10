import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery/image_gallery.dart';
import 'package:path_provider/path_provider.dart';
import 'gallery.dart';
// import 'package:path/path.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => MyPage(),

  },
));

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  /// Variable
  File imageFile;
  String imageFileStr;

  List<String> pics = [];

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Center(child: Text("Galleria")),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      _addFromPhoneGallery();                                                      //add from phone gallery function call
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _getFromCamera();                                                     //add from camera function call
                    },
                    child: Icon(
                      Icons.camera_alt
                    ),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      _openGallery();                                                         //open gallery function call
                    },
                    child: Icon(
                      Icons.photo,
                    ),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )
        )
    );
  }

    /// Get from gallery
    _addFromPhoneGallery() async {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      imageFile = File(pickedFile.path);
      imageFileStr = imageFile.toString();

      int length = imageFileStr.length;
      print("#####################################################");
      print(imageFileStr);
      print("#####################################################");

      imageFileStr = imageFileStr.substring(7,length-1);
      pics.add(imageFileStr);

      print("#####################################################");
      print(imageFileStr);
      print("#####################################################");


    }

    /// Get from Camera
    _getFromCamera() async {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      imageFile = File(pickedFile.path);
      imageFileStr = imageFile.toString();

      int length = imageFileStr.length;
      // print("#####################111111111111################################");
      // // print(imageFileStr);
      // print("#####################################################");

      // print("####################2222222222222#################################");
      // print(imageFileStr);
      // print("#####################################################");

      imageFileStr = imageFileStr.substring(7,length-1);

      // print("#######################3333333333333##############################");
      // print(imageFileStr);
      // print("#####################################################");



      pics.add(imageFileStr);
    }

    ///Open app gallery
    _openGallery() async {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Gallery(pics: pics)));


    }


  }