import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCustomAuth extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  const ButtonCustomAuth({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        side: BorderSide(
          color: color ?? Colors.grey,
        ),
      ),
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: color ?? Theme.of(context).colorScheme.onSurface,
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
    );

    return SizedBox(
      height: 42.h,
      width: double.maxFinite,
      child: TextButton(
        style: flatButtonStyle,
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
