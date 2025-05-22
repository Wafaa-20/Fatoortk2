import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/stoarge/saved_receipts_stoarge.dart';
import 'package:project4/features/home/presentation/controller/home_controller.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';
import 'package:project4/features/receipt/presentation/page/receipt_page.dart';
import 'package:project4/features/view_receipt/presentation/page/view_receipt_page.dart';

class ReceiptGradeView extends StatelessWidget {
  ReceiptGradeView({super.key});
  final homeController = HomeController();
  final receipts = SavedReceiptsStorage.savedReceiptsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: 0.70,
      ),
      itemCount: SavedReceiptsStorage.savedReceiptsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            customPush(context, ViewReceiptPage(receipt: receipts[index]));
          },
          child: SizedBox(
            // height: context.getHeight() * 0.50,
            width: context.getWidth() * 0.60,
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
                    child: SizedBox(
                      height: 120,
                      width: 184,
                      child: Image.file(
                        File(receipts[index].imagePath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    title: Text(receipts[index].supplierName.toString()),
                    subtitle: Text(receipts[index].warrantyDuration.toString()),

                    trailing: EditButton(
                      text: 'Edit',
                      onPressed: () {
                        customPush(context, ReceiptPage());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
