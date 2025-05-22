import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/stoarge/saved_receipts_stoarge.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/core/widget/bottom_nav_bar.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/core/widget/image_placeholder.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/presentation/page/receipt_page.dart';
import 'package:project4/features/view_receipt/presentation/widget/qr_widget.dart';
import 'package:project4/features/view_receipt/presentation/widget/receipt_Info.dart';

class ViewReceiptPage extends StatelessWidget {
  ViewReceiptPage({super.key, required this.receipt});

  // final String? imagePath;
  final ReceiptModel receipt;
  final receipts = SavedReceiptsStorage.savedReceiptsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Receipt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            customPush(context, BottomNavBar());
          },
        ),
        actions: [
          QrWidget(),
          IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: AppPalette.blueColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              receipt.imagePath != null
                  ? Image.file(
                    File(receipt.imagePath!),
                    fit: BoxFit.cover,
                    width: context.getWidth(),
                    height: context.getHeight() * 0.30,
                  )
                  : ImagePlaceholder(),

              SizedBox(height: 19),
              Row(
                children: [
                  Text("${receipt.supplierName}", style: TextStyles.cairo70024),
                  SizedBox(width: 30),
                ],
              ),
              SizedBox(height: 20),

              Container(
                width: context.getWidth(),
                // height: context.getHeight(),
                decoration: BoxDecoration(
                  color: AppPalette.checked,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReceiptInfo(
                        text: 'Purchase Date :',
                        receipt: receipt.purchaseDate ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Total Amount :',
                        receipt: receipt.totalAmount?.toStringAsFixed(2) ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Phone Number :',
                        receipt: receipt.supplierPhoneNumber ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Address :',
                        receipt: receipt.supplierAddress ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Invoice Number :',
                        receipt: receipt.receiptNumber ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Category :',
                        receipt: receipt.purchaseCategory ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'Warranty Duration :',
                        receipt: receipt.warrantyDuration ?? "-",
                      ),
                      SizedBox(height: 26),
                      ReceiptInfo(
                        text: 'More Details :',
                        receipt: receipt.importantInfo ?? "-",
                      ),
                      SizedBox(height: 26),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 26),

              Row(
                children: [
                  CustomButton(
                    onPressed: () {
                      receipts.remove(receipt);
                      customPop(context);
                    },
                    height: 36,
                    width: 186,
                    child: Text("Delete"),
                  ),
                  SizedBox(width: 7),
                  CustomButton(
                    onPressed: () {
                      customPush(context, ReceiptPage(receipt: receipt));
                    },
                    height: 36,
                    width: 186,
                    child: Text("Edit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
