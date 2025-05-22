import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project4/core/controller/image_picker_controller.dart';
import 'package:project4/core/function/navigaation.dart';
import 'package:project4/core/theme/app_palette.dart';
import 'package:project4/core/widget/custom_button.dart';
import 'package:project4/features/auth/presentation/controller/auth_controller.dart';
import 'package:project4/features/auth/presentation/page/login_page.dart';
import 'package:project4/features/home/presentation/widget/edit_button.dart';
import 'package:project4/features/receipt/data/model/receipt_model.dart';
import 'package:project4/features/receipt/presentation/controller/receipt_process_controller.dart';

class HomeController {
  ReceiptModel? receiptModel;
  final authController = AuthController();
  final controller = ReceiptProcessController();

  void editProfile(BuildContext context) {
    ImagePickerController();
  }

  void logOutShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppPalette.whiteColor,

            title: const Text("LogOut", textAlign: TextAlign.center),
            content: const Text(
              "Are you sure you want to log out? You'll need to login again to use the app.",
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 130,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppPalette.whiteColor,
                      ),

                      side: WidgetStateProperty.all(
                        BorderSide(color: AppPalette.blueColor, width: 2),
                      ),
                    ),
                    child: const Text("Cancel"),
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    width: 130,
                    onPressed: () {
                      customPushReplacement(context, LoginPage());
                    },
                    child: const Text("Log out"),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    // String selectedLang = context.locale.languageCode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppPalette.whiteColor,

          title: const Text("Choose Language", textAlign: TextAlign.center),

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                """The selected language will be used throughout the app.You can change it later from the settings.
                """,
                // textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    width: 130,
                    height: 40,
                    onPressed: () {
                      context.setLocale(const Locale('ar', 'AR'));
                      Navigator.pop(context);
                    },
                    child: Text("العربية"),
                  ),
                  EditButton(
                    width: 130,
                    height: 40,
                    onPressed: () {
                      context.setLocale(const Locale('en', 'US'));
                      Navigator.pop(context);
                    },

                    text: "English",
                  ),
                ],
              ),
            ],
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       if (selectedLang == 'ar') {
          //         context.setLocale(const Locale('ar', 'AR'));
          //       } else {
          //         context.setLocale(const Locale('en', 'US'));
          //       }
          //       Navigator.pop(context); // OK
          //     },
          //     child: const Text("Ok"),
          //   ),
          // ],
        );
      },
    );
  }
}
