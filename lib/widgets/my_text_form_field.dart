import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatefulWidget {
  final int maxLines;
  final TextEditingController controller;
  final validator;
  final onChanged;
  final onSubmit;
  final String title;
  final double height;
  final TextStyle titleStyle;
  final TextStyle style;
  final TextStyle errorStyle;
  final TextStyle hintStyle;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final double width;
  final double boarderWidth;
  final bool obscureText;
  final keyboardType;
  final Function onTap;
  final bool enabled;
  final String initialValue;
  final double borderRadius;
  final Color borderColor;
  final TextAlign textAlign;
  final EdgeInsets contentPadding;
  final bool filled;
  final BoxDecoration boxDecoration;

  const MyTextFormField({
    Key key,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
    this.title = '',
    this.width = double.infinity,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.titleStyle,
    this.onTap,
    this.enabled,
    this.initialValue,
    this.errorStyle,
    this.borderRadius,
    this.hintStyle,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.height,
    this.filled = false,
    this.style,
    this.boxDecoration,
    this.boarderWidth,
    this.borderColor,
    this.onSubmit,
  }) : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 65.h,
      decoration: widget.boxDecoration ?? BoxDecoration(
        borderRadius: BorderRadius.circular((widget.borderRadius ?? 5).sp),
        color: widget.filled ? Color(0xffF4F4F4) : Colors.transparent,
        border: Border.all(
            color: widget.borderColor ?? Colors.grey, width: widget.boarderWidth ?? 1.5.w,
        ),
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmit,
        onTap: widget.onTap,
        obscureText: widget.obscureText,
        textAlign: widget.textAlign,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        style: widget.style ?? TextStyle(decoration: TextDecoration.none, fontSize: 14.sp),
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: widget.contentPadding,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.sp),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.sp),
          ),
          errorStyle: widget.errorStyle ?? TextStyle(fontSize: 10.sp),
          border: InputBorder.none,
          hintText: widget.hintText ?? '',
          hintStyle: widget.hintStyle ?? TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
