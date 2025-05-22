import 'package:flutter/material.dart';
import 'package:project4/core/extension/git_size_screen.dart';
import 'package:project4/core/theme/app_palette.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? context.getHeight() * 0.30,
      width: width ?? context.getWidth(),
      decoration: BoxDecoration(color: AppPalette.checked),

      child: Icon(Icons.image, color: AppPalette.iconColor, size: 50),
    );
  }
}
