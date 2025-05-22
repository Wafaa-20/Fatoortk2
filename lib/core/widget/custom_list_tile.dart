import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,

    this.child,
    required this.title,
    this.onTap,
    this.subTitle,
  });
  final Widget? child;
  final Widget? title;
  final Widget? subTitle;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: child,
      title: title,
      subtitle: subTitle,
      onTap: onTap,
    );
  }
}
