import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:project4/core/text/text_styles.dart';

class CustomBottomPicker {
  static openBottomPicker(
    BuildContext context,
    String text,
    TextEditingController controller,
  ) {
    BottomPicker.date(
      pickerTitle: Text(text, style: TextStyles.cairo60016),
      dateOrder: DatePickerDateOrder.dmy,
      onSubmit: (date) {
        controller.text = date.toString().split(' ')[0];
      },
    ).show(context);
  }
}
