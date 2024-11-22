import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/shared/widgets/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietsDialog extends BaseDialog {
  final String? acceptButtonText;
  final VoidCallback? onAcceptButton;
  final Widget widgetDescription;
  final String title;

  DietsDialog({
    this.onAcceptButton,
    this.acceptButtonText,
    required this.widgetDescription,
    required this.title,
  });

  @override
  Widget createAcceptButton({BuildContext? context}) {
    return ButtonCustomAuth(
      onPressed: () => Navigator.of(context!).pop(),
      label: 'Aceptar',
      color: Colors.blue,
    );
  }

  @override
  Widget? createCancelButton({BuildContext? context}) {
    return null;
  }

  @override
  Widget createDescription() {
    return widgetDescription;
  }

  @override
  Widget? createTitle() {
    return Text(
      'Ejercicio $title',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  bool horizontal() => false;

  @override
  Widget? createImage() {
    return Image.asset(AppImages.badgePlaceholder, width: 25.w, height: 25.w);
  }
}
