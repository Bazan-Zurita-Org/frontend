import 'package:flutter/material.dart';

class ButtonCustomAuth extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const ButtonCustomAuth({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.sizeOf(context).width / 1.8, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
        ),
      ),
    );
  }
}
