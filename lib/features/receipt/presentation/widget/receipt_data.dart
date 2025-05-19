import 'package:flutter/material.dart';
import 'package:project4/core/widget/custom_text_form_field.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';

class ReceiptData extends StatelessWidget {
  ReceiptData({super.key});
  final receiptController = ReceiptProcessController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Company",
            controller: receiptController.companyController,
          ),
          SizedBox(height: 20),

          CustomTextFormField(
            labelText: "Purchase Date",
            controller: receiptController.purchaseDateController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Purchase Time",
            controller: receiptController.purchaseTimeController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Total Amount",
            controller: receiptController.totalAmountController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "VAT / Taxes",
            controller: receiptController.vatController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Phone Number",
            controller: receiptController.supplierPhoneController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Address",
            controller: receiptController.supplierAddressController,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Invoice Number",
            controller: receiptController.invoiceNumberController,
          ),
        ],
      ),
    );
  }
}
