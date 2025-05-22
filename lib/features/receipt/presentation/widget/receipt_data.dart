import 'package:flutter/material.dart';
import 'package:project4/core/widget/custom_bottom_picker.dart';
import 'package:project4/core/widget/custom_text_form_field.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';

class ReceiptData extends StatelessWidget {
  const ReceiptData({super.key, required this.receiptController});
  final ReceiptProcessController receiptController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),

          CustomTextFormField(
            labelText: "Company",
            controller: receiptController.companyController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Purchase Date",
            icon: IconButton(
              onPressed: () {
                CustomBottomPicker.openBottomPicker(
                  context,
                  "Select Date",
                  receiptController.purchaseDateController,
                );
              },
              icon: Icon(Icons.calendar_month),
            ),
            controller: receiptController.purchaseDateController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Total Amount",
            controller: receiptController.totalAmountController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Phone Number",
            controller: receiptController.supplierPhoneController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Address",
            controller: receiptController.supplierAddressController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Invoice Number",
            controller: receiptController.invoiceNumberController,
          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "Category",
            controller: receiptController.categoryController,
          ),
          const SizedBox(height: 20),

          CustomTextFormField(
            labelText: "Warranty Duration",
            icon: IconButton(
              onPressed: () {
                CustomBottomPicker.openBottomPicker(
                  context,
                  "Warranty Duration",
                  receiptController.warrantyDurationController,
                );
              },
              icon: Icon(Icons.calendar_month),
            ),
            controller: receiptController.warrantyDurationController,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            labelText: "More Details ",
            maxLines: 3,
            hintText: "write down important information.",
            controller: receiptController.importantInfoController,
          ),
        ],
      ),
    );
  }
}
