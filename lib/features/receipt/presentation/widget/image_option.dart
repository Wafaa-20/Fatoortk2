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
          onTap: () async {
            await widget.imageController.getImage(
              widget.imageController.cameraImage,
            );
            setState(() {
              widget.imageState;
            });
          },
          title: Text("Take Photo"),
          child: Icon(Icons.camera_alt),
        ),
        CustomListTile(
          onTap: () async {
            await widget.imageController.getImage(
              widget.imageController.galleryImage,
            );
            setState(() {
              widget.imageState;
            });
          },
          title: Text("Choose from Gallery"),
          child: Icon(Icons.photo_library),
        ),

        CustomListTile(
          // onTap: () async {
          //   await widget.imageController.getImage(
          //     widget.imageController.galleryImage,
          //   );
          //   widget.imageState;
          // },
          title: Text("Upload a File"),
          child: Icon(Icons.insert_drive_file),
        ),
      ],
    );
  }
}
