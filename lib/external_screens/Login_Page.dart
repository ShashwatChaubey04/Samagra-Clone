import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samagra_clone/external_screens/SignUp_Page.dart';
import '../constants/colors.dart';
import 'ForgetPassword_Page.dart';
import 'Home_Page.dart';

class Login_Page extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => Login_Page(),
  );

  @override
  State<Login_Page> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login_Page> {
  final rollnoController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscurePassword = true;
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    rollnoController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> loginUserWithEmailAndPassword() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      // Look up the email associated with the roll number
      final rollNoDoc = await FirebaseFirestore.instance
          .collection('roll_numbers')
          .doc(rollnoController.text.trim())
          .get();

      if (!rollNoDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No account found with this Roll Number.')),
        );
        return;
      }

      final email = rollNoDoc.data()!['email'];

      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home_Page()),
      );

    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found with this Roll Number.';
      }  else {
        message = 'Login failed';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.05),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                SizedBox(
                  height: height*0.12,
                  child: Image.asset('assets/local_image/loginPage_logo.png'),
                ),

                SizedBox(height: height*0.015),

                Text(
                  'Sign In',
                  style: TextStyle(
                    color: tdBlue,
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: height*0.01),

                Text(
                  'Enter your credentials',
                  style: TextStyle(
                    color: tdGrey,
                    fontSize: height*0.015,
                  ),
                ),

                SizedBox(height: height*0.02),

                SizedBox(
                  width: width*0.9,
                  height: height*0.06,
                  child: ElevatedButton.icon(
                    icon: Image.asset('assets/local_image/google_logo.jpg', height: 24),
                    onPressed: () {},
                    label: Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: tdBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height*0.02),

                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: tdGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                      child: const Text(
                        'Or',
                        style: TextStyle(
                          color: tdBlack,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: tdGrey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height*0.02),

                SizedBox(
                  height: height*0.056,
                  child: TextFormField(
                    controller: rollnoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your roll number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
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
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: obscurePassword,
                    obscuringCharacter: '•',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F4FB),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: tdGrey,
                        fontSize: height*0.015,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: tdGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height*0.01),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPassword_Page()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: tdBlack,
                        fontSize: width*0.025,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height*0.03),

                SizedBox(
                  width: width*0.9,
                  height: height*0.06,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : loginUserWithEmailAndPassword,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
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

                SizedBox(height: height*0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp_Page()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: tdBlue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}