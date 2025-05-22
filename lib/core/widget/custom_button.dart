import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.height,
    this.width,
  });
  final VoidCallback onPressed;
  final Widget child;
  
  final ButtonStyle? style;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 327, height ?? 48),
      ),
      child: child,
    );
  }
}
