import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/stoarge/saved_receipts_stoarge.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/data/repositories/receipt_api_recognizer.dart';
import 'package:project4/features/view_receipt/presentation/page/view_receipt_page.dart';

class ReceiptProcessController {
  final imagePickerController = ImagePickerController();
  XFile? selectedImage;
  ReceiptModel? receiptModel;

  final companyController = TextEditingController();
  final purchaseDateController = TextEditingController();
  final totalAmountController = TextEditingController();
  final supplierPhoneController = TextEditingController();
  final supplierAddressController = TextEditingController();
  final invoiceNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final warrantyDurationController = TextEditingController();
  final importantInfoController = TextEditingController();
  Future<ReceiptModel?> receptImageProcess(XFile file) async {
    final image = File(file.path);
    final result = await ReceiptApiRecognizer.analyzeReceipt(imageFile: image);
    return result;
  }

  void fillControllers(ReceiptModel receipt) {
    companyController.text = receipt.supplierName ?? '';
    purchaseDateController.text = receipt.purchaseDate ?? '';
    totalAmountController.text = receipt.totalAmount?.toStringAsFixed(2) ?? '';
    supplierPhoneController.text = receipt.supplierPhoneNumber ?? '';
    supplierAddressController.text = receipt.supplierAddress ?? '';
    invoiceNumberController.text = receipt.receiptNumber ?? '';
    categoryController.text = receipt.purchaseCategory ?? '';
    warrantyDurationController.text = receipt.warrantyDuration ?? '';
    importantInfoController.text = receipt.importantInfo ?? '';
  }

  ReceiptModel fromControllers() {
    return ReceiptModel(
      imagePath: selectedImage?.path,
      supplierName: companyController.text,
      purchaseDate: purchaseDateController.text,
      totalAmount: double.tryParse(totalAmountController.text),
      supplierPhoneNumber: supplierPhoneController.text,
      supplierAddress: supplierAddressController.text,
      receiptNumber: invoiceNumberController.text,
      purchaseCategory: categoryController.text,
      warrantyDuration: warrantyDurationController.text,
      importantInfo: importantInfoController.text,
    );
  }

  void saveReceipt(BuildContext context) {
    final newReceipt = fromControllers();
    SavedReceiptsStorage.savedReceiptsList.add(newReceipt);
    customPush(context, ViewReceiptPage(receipt: newReceipt));
  }
}
