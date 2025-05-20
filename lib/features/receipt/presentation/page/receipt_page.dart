import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';
import 'package:project4/features/receipt/presentation/widget/image_option.dart';
import 'package:project4/features/receipt/presentation/widget/receipt_data.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final receiptController = ReceiptProcessController();
  final imagePickerController = ImagePickerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Receipt')),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              child: SizedBox(
                height: context.getHeight() * 0.27,
                width: context.getWidth() * 0.95,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child:
                            // receiptController.selectedImage == null
                            imagePickerController.selectedImage == null
                                ? Text("Please Select image")
                                : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => Dialog(
                                            child: InteractiveViewer(
                                              child: Image.file(
                                                File(
                                                  imagePickerController
                                                      .selectedImage!
                                                      .path,
                                                ),
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
                                      File(
                                        imagePickerController
                                            .selectedImage!
                                            .path,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Add Image'),
                            EditButton(
                              text: 'Upload',
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),

                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: context.getHeight() * 0.50,
                                      child: Column(
                                        children: [
                                          ImageOption(
                                            imageController:
                                                imagePickerController,
                                            receiptController:
                                                receiptController,
                                            imageState: (receipt) {
                                              receiptController.fillControllers(
                                                receipt!,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ReceiptData(receiptController: receiptController),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                receiptController.saveReceipt(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
