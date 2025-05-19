import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/data/repositories/receipt_api_recognizer.dart';

class ReceiptProcessController {
  final imagePickerController = ImagePickerController();
  final companyController = TextEditingController();
  final purchaseDateController = TextEditingController();
  final purchaseTimeController = TextEditingController();
  final totalAmountController = TextEditingController();
  final vatController = TextEditingController();
  final supplierPhoneController = TextEditingController();
  final supplierAddressController = TextEditingController();
  final invoiceNumberController = TextEditingController();

  Future<void> reciptImageProcess(
    ImageSource source,
    Function(ReceiptModel?) onResult,
  ) async {
    final image = await imagePickerController.getImage(source);
    if (image != null) {
      final file = File(image);
      final result = await ReceiptApiRecognizer.analyzeReceipt(imageFile: file);
      onResult(result);
    } else {
      onResult(null);
    }
  }

  void fillControllers(ReceiptModel receipt) {
    companyController.text = receipt.supplierName ?? '';
    purchaseDateController.text = receipt.purchaseDate ?? '';
    purchaseTimeController.text = receipt.purchaseTime ?? '';
    totalAmountController.text = receipt.totalAmount?.toStringAsFixed(2) ?? '';
    vatController.text = receipt.totalTax?.toStringAsFixed(2) ?? '';
    supplierPhoneController.text = receipt.supplierPhoneNumber ?? '';
    supplierAddressController.text = receipt.supplierAddress ?? '';
    invoiceNumberController.text = receipt.receiptNumber ?? '';
  }
}
