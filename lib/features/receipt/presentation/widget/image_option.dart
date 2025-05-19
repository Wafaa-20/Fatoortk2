import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/widget/custom_list_tile.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';

class ImageOption extends StatefulWidget {
  const ImageOption({
    super.key,
    required this.imageState,
    required this.imageController,
  });
  final ImagePickerController imageController;
  final Function(ReceiptModel?) imageState;

  @override
  State<ImageOption> createState() => _ImageOptionState();
}

class _ImageOptionState extends State<ImageOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: Text("Take Photo"),
          child: IconButton(
            onPressed: () async {
              await widget.imageController.getImage(
                widget.imageController.cameraImage,
              );
              setState(() {
                widget.imageState;
              });
             
            },
            icon: Icon(Icons.camera_alt),
          ),
        ),
        CustomListTile(
          title: Text("Choose from Gallery"),
          child: IconButton(
            onPressed: () async {
              await widget.imageController.getImage(
                widget.imageController.galleryImage,
              );
              setState(() {
                widget.imageState;
              });
            },
            icon: Icon(Icons.photo_library),
          ),
        ),
        CustomListTile(
          title: Text("Upload a File"),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.insert_drive_file),
          ),
        ),
      ],
    );
  }
}
