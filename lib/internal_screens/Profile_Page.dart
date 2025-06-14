import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/external_screens/Login_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Resource_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login_Page()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 8;

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

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.9,
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text('User data not found'));
                }

                final userData = snapshot.data!.data() as Map<String, dynamic>;
                final name = userData['name'] ?? 'User Name';
                final rollNo = userData['rollNo'] ?? '202402XXXX';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.02),
                    Center(
                      child: Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: height * 0.05,
                                backgroundColor: Colors.grey[300],
                                child: user?.photoURL != null
                                    ? ClipOval(
                                  child: Image.network(
                                    user!.photoURL!,
                                    width: height * 0.08,
                                    height: height * 0.08,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : Icon(
                                  Icons.person,
                                  size: height * 0.08,
                                  color: tdBlack,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name.toUpperCase(),
                                      style: TextStyle(
                                        color: tdBlack,
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      rollNo,
                                      style: TextStyle(
                                        fontSize: height * 0.014,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    buildInfoTile(
                      'Email',
                      user?.email ?? 'No email provided',
                      trailing: Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: height * 0.025,
                      ),
                    ),
                    Divider(),
                    buildInfoTile(
                      'Id Card',
                      'Click to show your virtual identification card',
                    ),
                    Divider(),
                    buildInfoTile(
                      'Emergency Contact',
                      '',
                    ),
                    Divider(),
                    buildInfoTile(
                      'Phone Number',
                      user?.phoneNumber ?? 'No phone number provided',
                    ),
                    Divider(),
                    buildInfoTile(
                      'Change Password',
                      'Change the login password for your app',
                    ),
                    Divider(),
                    buildInfoTile(
                      'Change Email Address',
                      'Email address is used for resetting and changing passwords',
                    ),
                    Divider(),
                    buildInfoTile(
                      'Change Profile Photo',
                      'Change the profile photo',
                    ),
                    Divider(),
                    SizedBox(height: height * 0.015),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Follow us on',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/local_image/insta_logo.jpg',
                                  height: height * 0.03,
                                  width: height * 0.03,
                                ),
                              ),
                              SizedBox(width: width * 0.012),
                              Text(
                                'Instagram',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: tdBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/local_image/email_logo.jpg',
                                height: height * 0.035,
                                width: height * 0.035,
                              ),
                              SizedBox(width: width * 0.012),
                              Text(
                                'Support',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: tdBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/local_image/linkedin_logo.png',
                                height: height * 0.038,
                                width: height * 0.038,
                              ),
                              Text(
                                'Linkedin',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: tdBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.refresh),
                      label: Text(
                        'Check for updates',
                        style: TextStyle(
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(double.infinity, height * 0.05),
                        side: BorderSide(color: tdBlack),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    ElevatedButton(
                      onPressed: () => _logout(context),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, height * 0.05),
                        backgroundColor: tdBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildInfoTile(String title, String subtitle, {Widget? trailing}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 0),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: subtitle.isNotEmpty
        ? Text(
      subtitle,
      style: TextStyle(fontSize: 12),
    )
        : null,
    trailing: trailing,
  );
}