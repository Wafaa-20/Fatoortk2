import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:project4/core/theme/app_palette.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,

      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder:
                (context) => Dialog(
                  child: InteractiveViewer(
                    child: PrettyQrView.data(
                      data: "",
                      decoration: const PrettyQrDecoration(
                        image: PrettyQrDecorationImage(
                          image: AssetImage('asset/image/splash.png'),
                        ),
                        quietZone: PrettyQrQuietZone.zero,
                      ),
                    ),
                  ),
                ),
          );
        },
        child: Icon(Icons.qr_code_scanner, color: AppPalette.blueColor),
      ),
    );
  }
}
