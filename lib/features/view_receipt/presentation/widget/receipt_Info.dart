import 'package:flutter/material.dart';
import 'package:project4/core/text/text_styles.dart';

class ReceiptInfo extends StatelessWidget {
  const ReceiptInfo({super.key, required this.text, required this.receipt});
  final String text;
  final String receipt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(text, style: TextStyles.cairo60016),

          Text(receipt, style: TextStyles.cairo60016),
        ],
      ),
    );
  }
}
