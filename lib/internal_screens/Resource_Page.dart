import 'package:flutter/material.dart';
import 'package:samagra_clone/constants/colors.dart';
import 'package:samagra_clone/external_screens/Home_Page.dart';
import 'package:samagra_clone/internal_screens/Assignment_Page.dart';
import 'package:samagra_clone/internal_screens/Attendance_Page.dart';
import 'package:samagra_clone/internal_screens/Job_Page.dart';
import 'package:samagra_clone/internal_screens/Notice_Page.dart';
import 'package:samagra_clone/internal_screens/Profile_Page.dart';
import 'package:samagra_clone/internal_screens/Result_Page.dart';
import 'package:samagra_clone/internal_screens/Team_Page.dart';

class Resource_Page extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<Resource_Page> {
  // Lists for each tab
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> departments = ['BBA', 'BPHARMA', 'CE', 'CH', 'CSE', 'ECE', 'EE', 'IOT', 'IT', 'MCA', 'ME'];
  final List<String> sessions = ['2022-23', '2021-22', '2020-21', '2019-20'];
  final List<String> papers = ['Minor 1', 'Minor 2', 'Major'];

  final List<String> notesSubjects = ['Maths', 'Physics', 'Chemistry', 'Programming'];

  // Selected values
  String? selectedSemester;
  String? selectedDepartment;
  String? selectedSession;
  String? selectedPaper;

  String? selectedNoteSemester;
  String? selectedNoteDepartment;
  String? selectedNoteSubject;

  String? selectedSyllabusDepartment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final currentIndex = 3;

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Resources', style: TextStyle(color: Colors.black)),
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'PYQs'),
              Tab(text: 'Notes'),
              Tab(text: 'Syllabus'),
            ],
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
        body: TabBarView(
          children: [
            buildPyqPage(),
            buildNotesPage(),
            buildSyllabusPage(),
          ],
        ),
      ),
    );
  }

  /// PYQs Page
  Widget buildPyqPage() {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Semester',
                    semesters, selectedSemester, (value) {
                      setState(() {
                        selectedSemester = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Department',
                    departments, selectedDepartment, (value) {
                      setState(() {
                        selectedDepartment = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: height*0.005),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Session',
                    sessions, selectedSession, (value) {
                      setState(() {
                        selectedSession = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Paper',
                    papers, selectedPaper, (value) {
                      setState(() {
                        selectedPaper = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Notes Page
  Widget buildNotesPage() {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Semester',
                    semesters, selectedNoteSemester, (value) {
                      setState(() {
                        selectedNoteSemester = value;
                      });
                    },
                  ),
                ),

                Container(
                  height: height*0.045,
                  width: width*0.46,

                  child: buildDropdown(
                    'Select Department',
                    departments, selectedNoteDepartment, (value) {
                      setState(() {
                        selectedNoteDepartment = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.005),

          Center(
            child: Container(
              height: height*0.045,
              width: width*0.93,
              child: buildLargeDropdown(
                'Select Subject',
                notesSubjects, selectedNoteSubject, (value) {
                  setState(() {
                    selectedNoteSubject = value;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: height*0.02),

          Center(
            child: Container(
              height: height*0.06,
              width: width*0.93,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Notes by Subject Name or Subject Code',
                  hintStyle: TextStyle(
                    color: tdBlack,
                    fontSize: height*0.014,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: tdBlack),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: tdBlack),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Syllabus Page
  Widget buildSyllabusPage() {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height*0.045,
            width: width*0.93,
            child: buildLargeDropdown(
              'Select Department',
              departments, selectedSyllabusDepartment, (value) {
                setState(() {
                  selectedSyllabusDepartment = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable Small Dropdown
  Widget buildDropdown(String hint, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tdBlack),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tdBlack),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        hint: Text(
          hint,
          style: TextStyle(
            color: tdBlack,
            fontSize: height*0.014,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                color: tdBlack,
                fontSize: height*0.014,
                fontWeight: FontWeight.w400,
              ),
            ),
        )).toList(),
        onChanged: onChanged,
        dropdownColor: Colors.white,
      ),
    );

  }

  /// Reusable Large Dropdown
  Widget buildLargeDropdown(String hint, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tdBlack),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tdBlack),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        hint: Text(
          hint,
          style: TextStyle(
            color: tdBlack,
            fontSize: height*0.014,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                color: tdBlack,
                fontSize: height*0.014,
                fontWeight: FontWeight.w400,
              ),
            ),
        )).toList(),
        onChanged: onChanged,
        dropdownColor: Colors.white,
      ),
    );
  }
}
