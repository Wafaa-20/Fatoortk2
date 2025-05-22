import 'package:flutter/material.dart';
import 'package:project4/core/text/text_styles.dart';
import 'package:project4/core/theme/app_palette.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
  });
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppPalette.whiteColor),
        fixedSize: WidgetStateProperty.all(Size(width ?? 43, height ?? 28)),
        side: WidgetStateProperty.all(
          BorderSide(color: AppPalette.blueColor, width: 2),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),

      child: Text(
        text,
        style: TextStyles.cairo70020.copyWith(
          fontSize: 16,
          color: AppPalette.blueColor,
        ),
      ),
    );
  }
}
