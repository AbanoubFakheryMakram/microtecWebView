import 'package:flutter/material.dart';
import 'package:web_view_app/utils/extensions.dart';
import 'package:web_view_app/utils/consts.dart';

class MyButton extends StatefulWidget {
  MyButton(this.title, {Key key, this.onTap, this.btnColor, this.decoration, this.width, this.textStyle, this.height, this.margin, this.innerPadding, this.borderRadius}) : super(key: key);

  final String title;
  final Function onTap;
  final Color btnColor;
  final BoxDecoration decoration;
  final double width;
  final TextStyle textStyle;
  final double height;
  final EdgeInsets margin;
  final double innerPadding;
  final double borderRadius;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      margin: widget.margin,
      height: widget.height ?? 65.h,
      decoration: widget.decoration ??
          BoxDecoration(
            color: widget.btnColor ?? secondColor,
            borderRadius: BorderRadius.circular((widget.borderRadius ?? 5).sp),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular((widget.borderRadius ?? 5).sp),
        child: TextButton(
          onPressed: widget.onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (widget.innerPadding ?? 12).w,
            ),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: widget.textStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
