import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/data/repositories/receipt_api_recognizer.dart';
import 'package:project4/features/view_receipt/presentation/page/view_receipt_page.dart';

class ReceiptProcessController {
  final imagePickerController = ImagePickerController();
  XFile? selectedImage;
  bool isLoading = false;
  final companyController = TextEditingController();
  final purchaseDateController = TextEditingController();
  final purchaseTimeController = TextEditingController();
  final totalAmountController = TextEditingController();
  final vatController = TextEditingController();
  final supplierPhoneController = TextEditingController();
  final supplierAddressController = TextEditingController();
  final invoiceNumberController = TextEditingController();

  Future<ReceiptModel?> receptImageProcess(XFile file) async {
    final image = File(file.path);
    final result = await ReceiptApiRecognizer.analyzeReceipt(imageFile: image);
    return result;
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

  void saveReceipt(BuildContext context) {
    // var uuid = Uuid().v4();
    customPush(
      context,
      ViewReceiptPage(
        supplierName: companyController.text,
        purchaseDate: purchaseDateController.text,
        purchaseTime: purchaseTimeController.text,
        totalAmount: totalAmountController.text,
        vat: vatController.text,
        phoneNumber: supplierPhoneController.text,
        address: supplierAddressController.text,
        invoiceNumber: invoiceNumberController.text,
        imagePath: imagePickerController.selectedImage!.path,
      ),
    );
  }
}
