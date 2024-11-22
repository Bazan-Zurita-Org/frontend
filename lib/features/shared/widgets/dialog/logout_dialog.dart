import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/shared/widgets/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutDialog extends BaseDialog {
  final String? acceptButtonText;
  final VoidCallback? onAcceptButton;

  LogoutDialog({this.onAcceptButton, this.acceptButtonText});

  @override
  Widget createAcceptButton({BuildContext? context}) {
    return ButtonCustomAuth(
      onPressed: () {
        if (onAcceptButton != null) {
          onAcceptButton!();
        }
      },
      label: 'Aceptar',
      color: Colors.red,
    );
  }

  @override
  Widget? createCancelButton({BuildContext? context}) {
    return ButtonCustomAuth(
      onPressed: () => Navigator.of(context!).pop(),
      label: 'Cancelar',
      color: Colors.blueGrey,
    );
  }

  @override
  Widget createDescription() {
    return SizedBox(
      width: 240.w,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Estás seguro de',
            style: TextStyle(
              fontSize: 14.sp,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'salir.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
      ),
    );
  }

  @override
  Widget? createTitle() {
    return const Text(
      'Cerrar Sesión',
      style: TextStyle(
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
