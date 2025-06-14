import 'package:flutter/material.dart';

class Notification_Page extends StatelessWidget {
  const Notification_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: height*0.018,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(
              'No Notifications right now',
              style: TextStyle(
                fontSize: height*0.015,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}