import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';
import 'package:project4/features/receipt/presentation/widget/image_option.dart';
import 'package:project4/features/receipt/presentation/widget/load_image.dart';
import 'package:project4/features/receipt/presentation/widget/receipt_data.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key, this.receipt});
  final ReceiptModel? receipt;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final receiptController = ReceiptProcessController();
  final imagePickerController = ImagePickerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Receipt'),
        automaticallyImplyLeading: false,
      ),

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
                      LoadImage(imagePickerController: imagePickerController),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Add Image', style: TextStyles.inter80014),
                            EditButton(
                              text: 'Upload',
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppPalette.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),

                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: context.getHeight() * 0.40,
                                      width: context.getWidth(),
                                      child: ImageOption(
                                        imageController: imagePickerController,
                                        receiptController: receiptController,
                                        imageState: (receipt) {
                                          receiptController.selectedImage =
                                              imagePickerController
                                                  .selectedImage;
                                          receiptController.receiptModel =
                                              receipt;
                                          receiptController.fillControllers(
                                            receipt!,
                                          );
                                        },
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
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
