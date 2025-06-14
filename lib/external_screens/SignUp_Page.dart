import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samagra_clone/external_screens/Login_Page.dart';
import '../constants/colors.dart';
import 'Home_Page.dart';

class SignUp_Page extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => SignUp_Page(),
  );

  @override
  State<SignUp_Page> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp_Page> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  // Focus nodes
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode rollNoFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    rollNoController.dispose();

    // Dispose focus nodes
    nameFocusNode.dispose();
    rollNoFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      // Check if email already exists
      final emailSignInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailController.text.trim());
      if (emailSignInMethods.isNotEmpty) {
        throw FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'This email is already associated with another account',
        );
      }

      // Check if roll number already exists
      final rollNoSnapshot = await FirebaseFirestore.instance
          .collection('roll_numbers')
          .doc(rollNoController.text.trim())
          .get();

      if (rollNoSnapshot.exists) {
        throw FirebaseAuthException(
          code: 'rollno-already-in-use',
          message: 'This roll number is already associated with another account',
        );
      }

      // If both checks pass, create the user
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'name': nameController.text.trim(),
        'rollNo': rollNoController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      await FirebaseFirestore.instance
          .collection('roll_numbers')
          .doc(rollNoController.text.trim())
          .set({
        'userId': credential.user!.uid,
        'email': emailController.text.trim(),
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home_Page()),
      );

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Sign up failed')),
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: height * 0.12,
                  child: Image.asset('assets/local_image/loginPage_logo.png'),
                ),
                SizedBox(height: height * 0.015),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: tdBlue,
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'Create your account',
                  style: TextStyle(
                    color: tdGrey,
                    fontSize: height * 0.015,
                  ),
                ),
                SizedBox(height: height * 0.01),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.06,
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
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1, color: tdGrey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: const Text('Or', style: TextStyle(color: tdBlack)),
                    ),
                    const Expanded(child: Divider(thickness: 1, color: tdGrey)),
                  ],
                ),
                SizedBox(height: height * 0.01),
                // Name Field
                SizedBox(
                  height: height * 0.056,
                  child: TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(rollNoFocusNode);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F4FB),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: tdGrey,
                        fontSize: height * 0.015,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Roll No Field
                SizedBox(
                  height: height * 0.056,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: rollNoController,
                    focusNode: rollNoFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(emailFocusNode);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your roll number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F4FB),
                      hintText: 'University Roll No.',
                      hintStyle: TextStyle(
                        color: tdGrey,
                        fontSize: height * 0.015,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Email Field
                SizedBox(
                  height: height * 0.056,
                  child: TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F4FB),
                      hintText: 'Email-Id',
                      hintStyle: TextStyle(
                        color: tdGrey,
                        fontSize: height * 0.015,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Password Field
                SizedBox(
                  height: height * 0.056,
                  child: TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscurePassword,
                    obscuringCharacter: '•',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
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
                        fontSize: height * 0.015,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: tdGrey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Confirm Password Field
                SizedBox(
                  height: height * 0.056,
                  child: TextFormField(
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      createUserWithEmailAndPassword();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscureConfirmPassword,
                    obscuringCharacter: '•',
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F4FB),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: tdGrey,
                        fontSize: height * 0.015,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                          color: tdGrey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : createUserWithEmailAndPassword,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.017,
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
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login_Page()),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: tdBlue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}