import 'package:flutter/material.dart';

class InputCustomAuth extends StatefulWidget {
  final TextEditingController controller;
  final bool ispassword;
  final String label;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  const InputCustomAuth({
    super.key,
    required this.controller,
    this.ispassword = false,
    required this.label,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  });

  @override
  State<InputCustomAuth> createState() => _InputCustomAuthState();
}

class _InputCustomAuthState extends State<InputCustomAuth> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.ispassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: obscureText,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
