import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_app/main.dart';
import 'dart:io';
import 'package:path/path.dart';


class Gallery extends StatefulWidget {

  List<String> pics;
  Gallery({Key key,@required this.pics}) : super(key : key);

  @override
  _GalleryState createState() => _GalleryState(pics);
}

class _GalleryState extends State<Gallery> {

  List<String> pics;
  _GalleryState(this.pics);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('Gallery')),
        backgroundColor: Colors.deepOrange,
      ),

        body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
            itemCount: pics.length,

            itemBuilder: (context, index){
              return Container(
                alignment: Alignment.center,
                color: Colors.black,
                child: Image.file(
                  new File('${pics[index]}'),
                )
                // Image(                                       ///
                //     image: AssetImage('assets/${pics[index]}'),     ///
                //
                // )
              );
              // );
            }),

      )
    );
  }
}
