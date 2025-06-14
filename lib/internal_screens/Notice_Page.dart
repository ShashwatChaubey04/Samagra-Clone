import 'package:flutter/material.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Notice_Page extends StatelessWidget {
  const Notice_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 2;

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

    final notices = [
      {
        "title": "Detained Students Attendance List",
        "subtitle": "Attendance Notice",
        "date": "22 Apr 2025, 9:52 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Holiday Calendar 2025",
        "subtitle": "Holiday Calendar 2025",
        "date": "30 Mar 2025, 2:46 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "NOT Registered Student List (Even Sem)",
        "subtitle": "Session - 2024-25",
        "date": "28 Jan 2025, 3:52 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Scholarship Samaj Kalyan",
        "subtitle": "Update List",
        "date": "17 Jan 2025, 5:09 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Notice regarding practical schedule",
        "subtitle": "Practical schedule of BSM-140 for EE/ECE/IOT/ME",
        "date": "9 Jan 2025, 8:45 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Major Exam Schedule 1st Year(2024-28)",
        "subtitle": "Exam Schedule",
        "date": "5 Jan 2025, 8:43 am",
        "author": "MMMUT RESO",
      },
      {
        "title": "CDC-AlgOlympics",
        "subtitle": "Opportunity to experience regional ICPC based coding contest & win Cash Prizes 10,000/-",
        "date": "21 Dec 2024, 11:02 am",
        "author": "MMMUT RESO",
      },
      {
        "title": "Even Semester Registration",
        "subtitle": "For 2nd, 3rd and 4th Year.",
        "date": "9 Dec 2024, 9:14 am",
        "author": "MMMUT RESO",
      },
      {
        "title": "Reopen - Samarth Portal Exam Form",
        "subtitle": ".",
        "date": "2 Dec 2024, 3:44 pm",
        "author": "Prof. D.S Singh",
      },
      {
        "title": "Detained Attendance List",
        "subtitle": "Detained Students ( <75 )",
        "date": "28 Nov 2024, 12:43 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Minor-2 Final Year Seating Summary",
        "subtitle": ".",
        "date": "19 Nov 2024, 1:20 pm",
        "author": "Prof. D.S Singh",
      },
      {
        "title": "Minor-2 3rd_Year(2022–26) seating",
        "subtitle": "Seating Arrangement",
        "date": "19 Nov 2024, 1:20 pm",
        "author": "Prof. D.S Singh",
      },
      {
        "title": "Minor 1 Exam Schedule",
        "subtitle": "Exam Schedule",
        "date": "9 Nov 2024, 3:11 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "HOLIDAY NOTICE FOR CHHATH PUJA",
        "subtitle": "HOLIDAY NOTICE",
        "date": "6 Nov 2024, 7:58 pm",
        "author": "MMMUT RESO",
      },
      {
        "title": "Academic Calendar 2024-25",
        "subtitle": "Academic Calendar 2024-25",
        "date": "5 Nov 2024, 6:56 pm",
        "author": "Prof Sarv Pal Singh",
      },
      {
        "title": "Holiday Calendar Session - 2024-25",
        "subtitle": "Holiday Calendar 2024-25",
        "date": "16 Oct 2024, 5:49 pm",
        "author": "MMMT RES0",
      },
      {
        "title": "Time-Table 2024-28",
        "subtitle": "Time-Table 2024-28",
        "date": "28 Sept 2024, 11:37 am",
        "author": "Prof Sarv Pal Singh",
      },
      {
        "title": "UFM_Reconsideration_Notice",
        "subtitle": "UFM",
        "date": "28 Sept 2024, 11:43 am",
        "author": "Prof. D.S Singh",
      },
      {
        "title": "Attendance Report of Obc Students for Up Scholarsh...",
        "subtitle": "UP Scholarship 2024-25",
        "date": "21 Sept 2024, 12:01 pm",
        "author": "Prof. B.K. Panday",
      },
      {
        "title": "MSC Mtech Academic Calendar",
        "subtitle": "MSC M.tech Academic Calendar",
        "date": "21 Aug 2024, 5:37 pm",
        "author": "Prof. B.K. Panday",
      },
      {
        "title": "Revised Toppers List",
        "subtitle": "List of Medals",
        "date": "12 Aug 2024, 3:38 pm",
        "author": "Prof Sarv Pal Singh",
      },
      {
        "title": "New Academic Calendar 2024-25",
        "subtitle": "New Academic Calendar 2024-25 Session",
        "date": "26 Jun 2024, 12:01 pm",
        "author": "Prof Sarv Pal Singh",
      },
    ];


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height*0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Notices',
            style: TextStyle(
              fontSize: width*0.045,
            ),
          ),
          centerTitle: true,
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
      body: Center(
        child: Container(
          width: width*0.9,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: notices.length,
            itemBuilder: (context, index) {
              final notice = notices[index];
              return Center(
                child: Container(
                  width: width*0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Text(
                              notice["title"]!,
                              style: TextStyle(
                                fontSize: height*0.015,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Text(
                            notice["date"]!,
                            style: TextStyle(
                              fontSize: height*0.009,
                              color: Colors.grey[600],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: height*0.002),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notice["subtitle"]!,
                              style: TextStyle(
                                fontSize: height*0.01,
                                color: Colors.grey[600],
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Text(
                            notice["author"]!,
                            style: TextStyle(
                              fontSize: height*0.009,
                              color: Colors.grey[600],
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}