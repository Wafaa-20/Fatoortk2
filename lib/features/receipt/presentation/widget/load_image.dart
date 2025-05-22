import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/widget/image_placeholder.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({super.key, required this.imagePickerController});
  final ImagePickerController imagePickerController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child:
          imagePickerController.selectedImage == null
              ? ImagePlaceholder(height: 134, width: context.getWidth())
              : GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => Dialog(
                          child: InteractiveViewer(
                            child: Image.file(
                              File(imagePickerController.selectedImage!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  );
                },
                child: SizedBox(
                  height: 134,
                  width: context.getWidth(),
                  child: Image.file(
                    File(imagePickerController.selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
    );
  }
}
