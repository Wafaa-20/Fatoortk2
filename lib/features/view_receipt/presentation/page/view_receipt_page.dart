import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';

class ViewReceiptPage extends StatelessWidget {
  const ViewReceiptPage({
    super.key,
    required this.supplierName,
    required this.purchaseDate,
    required this.purchaseTime,
    required this.totalAmount,
    required this.vat,
    required this.phoneNumber,
    required this.address,
    required this.invoiceNumber,
    required this.imagePath,
  });
  final String supplierName;
  final String purchaseDate;
  final String purchaseTime;
  final String totalAmount;
  final String vat;
  final String phoneNumber;
  final String address;
  final String invoiceNumber;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Receipt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imagePath != null
              ? Image.file(
                File(imagePath!),
                fit: BoxFit.cover,
                width: context.getWidth(),
                height: context.getHeight() * 0.30,
              )
              : Placeholder(
                fallbackHeight: context.getHeight() * 0.30,
                fallbackWidth: context.getWidth(),
              ),

          // Image.file(
          //   File(imagePath),
          //   fit: BoxFit.cover,
          //   width: context.getWidth(),
          //   height: context.getHeight() * 0.30,
          // ),
          // Placeholder(
          //   fallbackHeight: context.getHeight() * 0.30,
          //   fallbackWidth: context.getWidth(),
          //   // child: Image.asset(imagePath!),
          // ),
          SizedBox(height: 19),
          Text("$supplierName"),
        ],
      ),
    );
  }
}
