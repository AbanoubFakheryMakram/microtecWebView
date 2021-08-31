
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_view_app/utils/app_localization.dart';
import 'package:web_view_app/utils/consts.dart';

import 'my_button.dart';

class AppDialogContent extends StatefulWidget {

  final Widget child;
  final double height;
  final double width;
  final bool showCloseButton;
  final bool useMargin;
  final bool useCancelDefaultButton;

  const AppDialogContent({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.showCloseButton = true,
    this.useCancelDefaultButton = true,
    this.useMargin = true,
  })  : assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => AppDialogContentState();
}

class AppDialogContentState extends State<AppDialogContent> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: widget.useMargin ? MediaQuery.of(context).viewInsets : null,
            width: widget.width ?? MediaQuery.of(context).size.width / 1.7,
            height: widget.height ?? MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.showCloseButton ? Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.cancel,
                      size: 30.sp,
                      color: Colors.grey[400],
                    ),
                  ),
                ) : null,
                widget.child,
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
               widget.useCancelDefaultButton ? MyButton(
                  AppLocalization.of(context).translate('ok'),
                  btnColor: mainColor,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ) : null,
              ].where((element) => element != null).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
