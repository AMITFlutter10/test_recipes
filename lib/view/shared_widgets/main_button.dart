import 'package:flutter/material.dart';
import 'default_text.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({Key? key,required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     child: SizedBox(
          height: 50,
          width: 100,
        child:  ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal
              ),
              child: Center(
                child: DefaultText(
                  text:text,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

            ),

          ),
    );
  }
}
