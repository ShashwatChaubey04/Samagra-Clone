import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Job_Page extends StatelessWidget {
  const Job_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 5;

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

    final jobs = [
      {
        "company": "Cornerstone",
        "position": "Intern - Intern",
        "batches": "2025",
        "stipend": "N.A",
        "workType": "Hybrid",
        "period": "3 Months",
        "date": "Mon Sep 30 2024",
        "logo": "assets/companies_logo/cornerstone.jpg",
      },
      {
        "company": "Salesforce",
        "position": "Fulltime - AMTS",
        "stipend": "N.A",
        "batches": "2024",
        "workType": "Hybrid",
        "period": "Full Time",
        "date": "Sun Sep 29 2024",
        "logo": "assets/companies_logo/salesforce.jpg",
      },
      {
        "company": "Oracle",
        "position": "Fulltime - Software developer 1",
        "stipend": "N.A",
        "batches": "2022, 2023, 2024",
        "workType": "Onsite",
        "period": "Full Time",
        "date": "Tue Sep 24 2024",
        "logo": "assets/companies_logo/oracle.jpg",
      },
      {
        "company": "MasterCard",
        "position": "Intern - Data scientist",
        "stipend": "N.A",
        "batches": "2025, 2026",
        "workType": "Remote",
        "period": "Full Time",
        "date": "Sun Sep 22 2024",
        "logo": "assets/companies_logo/mastercard.png",
      },
      {
        "company": "Google",
        "position": "Intern - Software Engineer",
        "stipend": "N.A",
        "batches": "2025",
        "workType": "Onsite",
        "period": "4 Months",
        "date": "Fri Oct 15 2024",
        "logo": "assets/local_image/google_logo.jpg",
      },
      {
        "company": "Amazon",
        "position": "Fulltime - Software Development Engineer",
        "stipend": "N.A",
        "batches": "2023, 2024",
        "workType": "Hybrid",
        "period": "Full Time",
        "date": "Mon Nov 05 2024",
        "logo": "assets/companies_logo/amazon.png",
      },
      {
        "company": "Microsoft",
        "position": "Intern - Cloud Solutions Architect",
        "stipend": "N.A",
        "batches": "2025",
        "workType": "Remote",
        "period": "6 Months",
        "date": "Wed Oct 10 2024",
        "logo": "assets/companies_logo/microsoft.png",
      },
      {
        "company": "Facebook",
        "position": "Fulltime - Data Analyst",
        "stipend": "N.A",
        "batches": "2024",
        "workType": "Onsite",
        "period": "1 Year",
        "date": "Thu Oct 20 2024",
        "logo": "assets/companies_logo/facebook.png",
      },
      {
        "company": "Tesla",
        "position": "Intern - Mechanical Engineer",
        "stipend": "N.A",
        "batches": "2025",
        "workType": "Hybrid",
        "period": "3 Months",
        "date": "Sat Sep 28 2024",
        "logo": "assets/companies_logo/tesla.png",
      },
      {
        "company": "IBM",
        "position": "Fulltime - Business Analyst",
        "stipend": "N.A",
        "batches": "2022, 2023",
        "workType": "Remote",
        "period": "Full Time",
        "date": "Tue Oct 15 2024",
        "logo": "assets/companies_logo/ibm.jpg",
      },
      {
        "company": "Google",
        "position": "Intern - Application engineer",
        "stipend": "1.25+ Lakh/Month",
        "batches": "All",
        "workType": "Onsite",
        "period": "2 Months",
        "date": "Fri Sep 20 2024",
        "logo": "assets/local_image/google_logo.jpg",
      }
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Jobs'),
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

      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Column(
            children: [
              Container(
                width: width*0.94,
                height: height*0.18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: tdGrey),
                ),
                child: Column(
                  children: [

                    SizedBox(height: height*0.01),

                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width*0.025),
                        child: Container(
                          child: Text(
                            job["date"]!,
                            style: TextStyle(
                              fontSize: 9,
                              color: tdGrey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: width*0.02),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: height*0.035,
                              width: width*0.08,
                              child: Image.asset(
                                job["logo"]!,
                              ),
                            ),

                            SizedBox(width: width * 0.03),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  job["company"]!,
                                  style: TextStyle(
                                    fontSize: width*0.038,
                                    fontWeight: FontWeight.w500,
                                    height: 1.0,
                                  ),
                                ),
                                Text(
                                  job["position"]!,
                                  style: TextStyle(
                                    fontSize: width*0.026,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height*0.01),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: width*0.025),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Stipend: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: height*0.013,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: job["stipend"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Text.rich(
                                  TextSpan(
                                    text: "For Batches: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: height*0.013,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: job["batches"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: width*0.025),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text.rich(
                                  TextSpan(
                                    text: "Work Type: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: height*0.013,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: job["workType"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Text.rich(
                                  TextSpan(
                                    text: "Period: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: height*0.013,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: job["period"]!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Center(
                      child: Container(
                        width: width*0.88,
                        height: height*0.038,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "More Details",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height*0.01),
            ],
          );
        },
      ),
    );
  }
}