import 'dart:io';

import 'package:adnproject/blocs/card_info/card_info_bloc.dart';
import 'package:adnproject/blocs/card_info/card_info_state.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

/// The button to select or take an image for the SelectImageScreen
class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    Key key,
    this.height,
    this.width,
    this.imageSource,
    this.callback,
  }) : super(key: key);

  final height;
  final width;
  final imageSource;
  final callback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardInfoBloc, CardInfoState>(
      builder: (BuildContext context, CardInfoState state) {
        final roundedBorderRadius = BorderRadius.circular(20.0);
        final imageFile = imageSource();
        return Container(
          height: this.height,
          width: this.width,
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
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Center(
                          child: Image.file(
                            imageFile,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
            onPressed: () => _getImage(context),
          ),
        );
      },
    );
  }

  void _getImage(BuildContext context) async {
    var imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Strings.selectIdCardImage),
          content: Text(Strings.permissionIsRequired),
          actions: <Widget>[
            FlatButton(
              child: Text('Camera'),
              textTheme: ButtonTextTheme.normal,
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            FlatButton(
              child: Text('Gallery'),
              textTheme: ButtonTextTheme.normal,
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        );
      },
    );
    if (imageSource != null) {
      final imagePicker = new ImagePicker();
      await imagePicker.getImage(source: imageSource).then((picked) {
        if (picked != null) {
          this.callback(File(picked.path));
        }
      });
    }
  }
}
