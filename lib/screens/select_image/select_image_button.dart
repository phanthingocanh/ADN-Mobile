import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// The button to select or take an image for the SelectImageScreen
class SelectImageButton extends StatefulWidget {
  const SelectImageButton({
    Key key,
    this.height,
    this.width,
    this.onDone,
    this.initialImage,
  }) : super(key: key);

  final height;
  final width;
  final onDone;
  final initialImage;

  @override
  State createState() => SelectImageState(imageFile: initialImage);
}

class SelectImageState extends State<SelectImageButton> {
  SelectImageState({this.imageFile});

  File imageFile;

  @override
  Widget build(BuildContext context) {
    final roundedBorderRadius = BorderRadius.circular(20.0);
    return Container(
      height: this.widget.height,
      width: this.widget.width,
      margin: EdgeInsets.all(10.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: roundedBorderRadius,
        ),
        padding: EdgeInsets.all(0.0),
        textTheme: ButtonTextTheme.normal,
        child: imageFile == null
            ? Icon(Icons.image)
            : ClipRRect(
                borderRadius: roundedBorderRadius,
                child: Image.file(
                  imageFile,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
        onPressed: _getImage,
      ),
    );
  }

  void _getImage() async {
    var imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select the image source"),
          actions: <Widget>[
            FlatButton(
              child: Text("Camera"),
              textTheme: ButtonTextTheme.normal,
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            FlatButton(
              child: Text("Gallery"),
              textTheme: ButtonTextTheme.normal,
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        );
      },
    );
    if (imageSource != null) {
      await ImagePicker.pickImage(source: imageSource).then((value) {
        setState(() {
          imageFile = value;
        });
      });
    }
    widget.onDone();
  }
}
