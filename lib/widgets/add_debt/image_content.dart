import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/repository/repository.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;

class ImageReceiver extends StatefulWidget {
  final Function onTap;
  ImageReceiver({this.onTap});
  @override
  _ImageReceiverState createState() => _ImageReceiverState();
}

class _ImageReceiverState extends State<ImageReceiver> {
  File selectedImage;
  Repository repository = Repository();
  Future takePicture() async {
    final imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 80);
    if (imageFile == null) {
      return;
    }
    selectedImage = imageFile;
    final appDir = await pathProvider.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final saveImage = await imageFile.copy("${appDir.path}/$fileName");
    widget.onTap(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: takePicture,
            child: CircleAvatar(
              backgroundImage: selectedImage == null
                  ? AssetImage("assets/images/boy.png")
                  : FileImage(selectedImage),
              radius: 80,
            ),
          ),
          Positioned(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24,
              ),
            ),
            bottom: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
