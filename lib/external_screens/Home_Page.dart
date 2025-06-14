import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Notification_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userName = "User";
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          setState(() {
            userName = userDoc['name'] ?? "User";
          });
        }
      } catch (e) {
        print("Error loading user data: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

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
        title: Row(
          children: [
            Container(
              width: width*0.07,
              height: width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: tdGrey),
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person, size: width*0.05),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ),
            SizedBox(width: width*0.03),
            Text(
              'Hello, $userName',
              style: TextStyle(
                fontSize: width*0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notification_Page()),
              );
            },
            icon: Padding(
              padding: EdgeInsets.only(right: width*0.02),
              child: Icon(Icons.notifications_none, size: width*0.065),
            ),
          ),
        ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.02),
          Container(
            height: height*0.15,
            width: width*0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/local_image/campus_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Attendance_Page()),
                  );
                },
                child: Container(
                  height: height*0.07,
                  width: width*0.16,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F9),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.how_to_reg, size: width*0.065),
                      Text(
                        'Attendance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tdBlack,
                          fontSize: width*0.023,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resource_Page()),
                  );
                },
                child: Container(
                  height: height*0.07,
                  width: width*0.16,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F9),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.menu_book_rounded, size: width*0.065),
                      Text(
                        'Resources',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tdBlack,
                          fontSize: width*0.023,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Result_Page()),
                  );
                },
                child: Container(
                  height: height*0.07,
                  width: width*0.16,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F9),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.bar_chart, size: width*0.065),
                      Text(
                        'Result',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tdBlack,
                          fontSize: width*0.023,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notice_Page()),
                  );
                },
                child: Container(
                  height: height*0.07,
                  width: width*0.16,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F9),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.announcement, size: width*0.065),
                      Text(
                        'Notices',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tdBlack,
                          fontSize: width*0.023,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Assignment_Page()),
                  );
                },
                child: Container(
                  height: height*0.07,
                  width: width*0.16,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F9),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.assignment, size: width*0.065),
                      Text(
                        'Assignments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: tdBlack,
                          fontSize: width*0.023,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
        ],
      ),
    );
  }
}