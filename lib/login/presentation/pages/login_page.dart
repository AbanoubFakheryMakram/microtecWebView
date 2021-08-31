
import 'package:flutter/material.dart';
import 'package:web_view_app/utils/consts.dart';
import 'package:web_view_app/utils/extensions.dart';
import 'package:web_view_app/widgets/my_button.dart';
import 'package:web_view_app/widgets/my_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              Align(
                alignment: Alignment.topLeft,
                child: DropdownButton<String>(
                  underline: SizedBox.shrink(),
                  items: <String>['العربية'.tr(context), 'English'.tr(context),].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Image.asset('assets/images/Flag-Saudi-Arabia.jpg'),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
              SizedBox(height: 70.h,),
              Image.asset('assets/images/logo.png', width: size.width * .5,),
              SizedBox(height: 70.h,),
              Container(
                width: size.width,
                child: Card(
                  color: loginCardBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 14.w),
                    child: Column(
                      children: [
                        Text('login'.tr(context), style: TextStyle(fontSize: 24.sp),),
                        SizedBox(height: 40.h,),
                        MyTextFormField(
                          hintText: 'username'.tr(context),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                        ),
                        SizedBox(height: 20.h,),
                        MyTextFormField(
                          hintText: 'password'.tr(context),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                        ),
                        SizedBox(height: 20.h,),
                        MyButton('login1'.tr(context)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
