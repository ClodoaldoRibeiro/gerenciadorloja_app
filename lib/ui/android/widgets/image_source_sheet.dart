import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  void imageSelected(File image) async {
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(sourcePath: image.path);
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Foto da categoria",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    File image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    imageSelected(image);
                  },
                  child: Column(

                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/foto.png",
                          fit: BoxFit.cover,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Câmera",),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    File image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    imageSelected(image);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/galeria.png",
                          fit: BoxFit.cover,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Galeria"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
