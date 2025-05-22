import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/custom_text_button.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';

class ImageOption extends StatefulWidget {
  const ImageOption({
    super.key,
    required this.imageState,
    required this.imageController,
    required this.receiptController,
  });
  final ImagePickerController imageController;
  final ReceiptProcessController receiptController;
  final Function(ReceiptModel?) imageState;

  @override
  State<ImageOption> createState() => _ImageOptionState();
}

class _ImageOptionState extends State<ImageOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upload From :",
                style: TextStyles.cairo70024.copyWith(
                  color: AppPalette.blueColor2,
                ),
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Cancel",
              ),
            ],
          ),
        ),
        SizedBox(height: 44),
        CustomButton(
          onPressed: () async {
            final image = await widget.imageController.getImage(
              widget.imageController.cameraImage,
            );
            //save image selected
            widget.receiptController.selectedImage = image;
            final receipt = await widget.receiptController.receptImageProcess(
              image!,
            );

            setState(() {
              widget.imageState(receipt);
            });
          },
          width: 364,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt, size: 30),
              SizedBox(width: 8),
              Text("Camera", style: TextStyles.cairo60020),
            ],
          ),
        ),
        SizedBox(height: 24),
        CustomButton(
          onPressed: () async {
            final image = await widget.imageController.getImage(
              widget.imageController.galleryImage,
            );
            //save image was selected
            widget.receiptController.selectedImage = image;
            //image processes
            final receipt = await widget.receiptController.receptImageProcess(
              image!,
            );
            if (!mounted) return;

            setState(() {
              widget.imageState(receipt);
            });
          },

          width: 364,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library, size: 30),
              SizedBox(width: 8),
              Text("Library", style: TextStyles.cairo60020),
            ],
          ),
        ),
        SizedBox(height: 24),
        CustomButton(
          onPressed: () async {
            final image = await widget.imageController.getImage(
              widget.imageController.galleryImage,
            );
            final receipt = await widget.receiptController.receptImageProcess(
              image!,
            );
            setState(() {
              widget.imageState(receipt);
            });
          },
          width: 364,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.insert_drive_file, size: 30),
              SizedBox(width: 8),
              Text("Document", style: TextStyles.cairo60020),
            ],
          ),
        ),
      ],
    );
  }
}
