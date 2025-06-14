import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ForgetPassword_Page extends StatelessWidget {
  const ForgetPassword_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            SizedBox(
              height: height*0.03,
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height*0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: height*0.04),

            SizedBox(
              height: height*0.056,
              width: width*0.9,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1F4FB),
                  hintText: 'University Roll No.',
                  hintStyle: TextStyle(
                    color: tdGrey,
                    fontSize: height*0.015,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: height*0.015),

            SizedBox(
              height: height*0.056,
              width: width*0.9,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height*0.017,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tdBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}