import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Attendance_Page extends StatelessWidget {
  const Attendance_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 1;

    final List<String> titles = [
      'Home',
      'Attendance',
      'Notices',
      'Resources',
      'Assignments',
      'Jobs',
      'Result',
      'Team',
      'Profile',
    ];

    final List<IconData> icons = [
      Icons.home,
      Icons.person,
      Icons.article_outlined,
      Icons.menu_book_outlined,
      Icons.assignment,
      Icons.work_outline,
      Icons.bar_chart_outlined,
      Icons.groups_outlined,
      Icons.account_circle_outlined,
    ];

    final List<Widget> pages = [
      Home_Page(),
      Attendance_Page(),
      Notice_Page(),
      Resource_Page(),
      Assignment_Page(),
      Job_Page(),
      Result_Page(),
      Team_Page(),
      Profile_Page(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Attendance',
          style: TextStyle(
            fontSize: height*0.02,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index){
            final isSelected = index == currentIndex;
            return InkWell(
              onTap: () {
                if(!isSelected){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pages[index]),
                  );
                }
                else{
                  Navigator.pop(context);
                }
              },
              child: Column(
                children: [
                  SizedBox(height: height*0.001),
                  Container(
                    width: width*0.65,
                    height: height*0.055,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade50 : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        size: height*0.025,
                        color: Colors.black87,
                      ),

                      title: Text(
                        titles[index],
                        style: TextStyle(
                            fontSize: width * 0.03,
                            color: isSelected ? Colors.blue : Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [

          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              height: height*0.06,
              width: width*0.9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overall Attendance',
                      style: TextStyle(
                        color: tdBlack,
                        fontSize: height*0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '0.00%',
                      style: TextStyle(
                        color: tdBlack,
                        fontSize: height*0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.015),

          Text(
            'June 2025',
            style: TextStyle(
              fontSize: height*0.018,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: height * 0.01),

          SizedBox(
            height: height*0.075,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [

              ],
            ),
          ),

          SizedBox(height: height * 0.01),

          Text(
            'No Attendance marked for this date',
            style: TextStyle(
              color: tdGrey,
              fontSize: height*0.015,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}