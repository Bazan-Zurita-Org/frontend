import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.0.w),
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
          // SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: widget.onTap,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    obscureText: obscureText,
                    readOnly: widget.readOnly,
                    cursorColor: Colors.blue,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
                if (widget.ispassword)
                  GestureDetector(
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
                else if (widget.suffixIcon != null)
                  widget.suffixIcon!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
