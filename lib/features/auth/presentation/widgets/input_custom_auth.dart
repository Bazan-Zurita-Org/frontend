import 'package:flutter/material.dart';

class InputCustomAuth extends StatefulWidget {
  final TextEditingController controller;
  final bool ispassword;
  final String label;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  const InputCustomAuth({
    super.key,
    required this.controller,
    this.ispassword = false,
    required this.label,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.padding,
    this.suffixIcon,
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
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: obscureText,
        readOnly: widget.readOnly,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 16),
          floatingLabelStyle: const TextStyle(color: Colors.blue),
          suffixIcon: widget.ispassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.blue,
                        ),
                )
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
