import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/shared/widgets/dialog/base_dialog.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends BaseDialog {
  final String? acceptButtonText;
  final String title;
  final String description;

  SuccessDialog({
    this.acceptButtonText,
    required this.title,
    required this.description,
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
    return Text(
      description,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
      ),
    );
    ;
  }

  @override
  Widget? createTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  bool horizontal() => false;

  @override
  Widget? createImage() {
    return null;
  }
}
