import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({Key? key,required this.text, required this.onTap}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     child: SizedBox(
          height: 6.h,
          width: 25.w,
        child:  ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal
              ),
              child: Center(
                child: DefaultText(
                  text:text,
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),

            ),

          ),
    );
  }
}
