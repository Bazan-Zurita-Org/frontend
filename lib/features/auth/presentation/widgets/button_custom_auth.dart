import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: robotoBold(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
