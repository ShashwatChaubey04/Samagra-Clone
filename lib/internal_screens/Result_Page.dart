import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Result_Page extends StatelessWidget {
  const Result_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 6;

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
          'Result',
          style: TextStyle(
              fontSize: width*0.05
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.04),
                Text(
                  'Batch:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.015,
                  ),
                ),
                Text(
                  'Roll Nu.:',
                  style: TextStyle(
                    color: tdGrey,
                    fontSize: height * 0.015,
                  ),
                ),
                Text(
                  'Enrollment No.:',
                  style: TextStyle(
                    color: tdGrey,
                    fontSize: height * 0.015,
                  ),
                ),
                Text(
                  'Department:',
                  style: TextStyle(
                    color: tdGrey,
                    fontSize: height * 0.015,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: height * 0.02),

          Center(
            child: Text(
              'Semester wise Result Data',
              style: TextStyle(
                color: tdBlack,
                fontSize: width*0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: height * 0.01),

          Center(
            child: Container(
              width: width*0.9,
              child: Table(
                border: TableBorder.all(color: tdGrey),
                columnWidths: {
                  0 : FlexColumnWidth(2),
                  1 : FlexColumnWidth(1.5),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            'Semester',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            'CGPA',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for(int i=1; i<=8; i++)
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(child: Text('Semester $i')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(child: Text("")),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          SizedBox(height: height*0.03),

          Center(
            child: SizedBox(
              width: width*0.9,
              height: height*0.06,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Show Rank',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}