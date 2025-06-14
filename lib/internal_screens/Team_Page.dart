import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';

class Team_Page extends StatelessWidget {
  const Team_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 7;

    double avatarSize = height*0.1;
    double nameFontSize = height*0.015;
    double deptFontSize = height*0.012;

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

    List<Map<String, String>> teamMembers = [
      {"name": "Sandeep Singh", "dept": "ECE", "image": "assets/teamMembers_image/sandeep_singh.jpg"},
      {"name": "Tejas Mishra", "dept": "IT", "image": "assets/teamMembers_image/tejas_mishra.jpeg"},
      {"name": "Aditya Gaur", "dept": "CSE", "image": "assets/teamMembers_image/aditya_gaur.jpg"},
      {"name": "Anjul Singh", "dept": "IT", "image": "assets/teamMembers_image/anjul_singh.jpg"},
      {"name": "Prabhat Yadav", "dept": "IT", "image": "assets/teamMembers_image/prabhat_yadav.jpg"},
      {"name": "Aashi Awasthi", "dept": "ECE", "image": "assets/teamMembers_image/aashi_awasthi.jpeg"},
      {"name": "Prachi Patel", "dept": "IT", "image": "assets/teamMembers_image/prachi_patel.jpeg"},
      {"name": "Manoj Kumar", "dept": "IT", "image": "assets/teamMembers_image/manoj_kumar.jpg"},
      {"name": "Harsh Agrahari", "dept": "CSE", "image": "assets/teamMembers_image/harsh_agrahari.jpg"},
      {"name": "Rudra Dubey", "dept": "IT", "image": "assets/teamMembers_image/rudra_dubey.jpg"},
      {"name": "Aditya Patel", "dept": "BPHARM", "image": "assets/teamMembers_image/aditya_patel.png"},
      {"name": "Krishna Chaurasiya", "dept": "BBA", "image": "assets/teamMembers_image/krishna_chaurasiya.png"},
      {"name": "Vishal Paswan", "dept": "ECE", "image": "assets/teamMembers_image/vishal_paswan.jpg"},
      {"name": "Anmol Tripathi", "dept": "IT", "image": "assets/teamMembers_image/anmol_tripathi.jpg"},
    ];

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Team',
          style: TextStyle(
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

      body: Expanded(
        child: SingleChildScrollView(

          child: Column(
            children: [

              SizedBox(height: height*0.015),

              Center(
                child: Container(
                  width: width*0.95,
                  height: height*0.05,
                  color: tdBlack,
                  child: Center(
                    child: Text(
                      'Pre Final Year',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height*0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height*0.015),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: width*0.06,
                runSpacing: height*0.03,
                children: teamMembers.map((member) {
                  return Container(
                    width: width*0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: avatarSize/2,
                          backgroundImage: AssetImage(member["image"]!),
                        ),

                        SizedBox(height: height*0.008),

                        Text(
                          member["name"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: tdGrey,
                            fontSize: nameFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          member["dept"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: deptFontSize,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: height*0.03),
            ],
          ),
        ),
      ),
    );
  }
}