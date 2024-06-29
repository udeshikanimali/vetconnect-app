import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetconnect_app/View/auth/signin.dart';

import '../../font_styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final singUpFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isRetypePasswordVisible = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _reEnterPasswordController;
  final int maxInputLength = 16;
  bool buttonEnabled = true;

  bool isChecked = false;

  @override
  void initState() {
    isPasswordVisible = false;
    isRetypePasswordVisible = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _reEnterPasswordController = TextEditingController();
    super.initState();
    buttonEnabled = false;
    isChecked = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    super.dispose();
  }

  // doSignUp(String email, String password, String reEnterPassword) async {
  //    setState(() {
  //     buttonEnabled=false;
  //   });
  //   AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
  //   // PageLoader.showLoader(context);
  //   bool result = await auth.signUpWithEmail(context, email, password,reEnterPassword);
  //   if(result==false){
  //      setState(() {
  //     buttonEnabled=true;
  //   });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = screenHeight * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.08, right: screenWidth * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Text(
                  "Sign Up",
                  style: FontStyles.titleTextStyle(context),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: screenWidth * 0.015 + 10,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Form(
                  key: singUpFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: FontStyles.bodyTextStyle(context),
                        cursorColor: Colors.green,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("^[0-9a-zA-Z\@\.]*")),
                        ],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 3.0,
                              ),
                            ),
                            hintText: "Enter your email",
                            hintStyle: FontStyles.hintTextStyle(context),
                            errorStyle: FontStyles.errorTextStyle(context),
                            contentPadding: EdgeInsets.all(screenWidth * 0.04)),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.015 + 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: FontStyles.bodyTextStyle(context),
                        cursorColor: Colors.green,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required password";
                          } else if (value.length < 8) {
                            return "Password at least 8 characters";
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp("^[0-9a-zA-Z ]*")),
                          FilteringTextInputFormatter.allow(
                            RegExp(
                                r"^[0-9a-zA-Z !#$%&'*+\-/=?^_`{|}~@.,<>()]*"),
                          ),

                          LengthLimitingTextInputFormatter(maxInputLength),
                        ],
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 3.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.015),
                              child: IconButton(
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                iconSize: screenHeight * 0.03,
                                color: HexColor("#898989"),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: FontStyles.hintTextStyle(context),
                            errorStyle: FontStyles.errorTextStyle(context),
                            contentPadding:
                                EdgeInsets.all(screenWidth * 0.038)),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(
                              "Re-enter password",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.015 + 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      TextFormField(
                        controller: _reEnterPasswordController,
                        style: FontStyles.bodyTextStyle(context),
                        cursorColor: Colors.green,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required re-type password";
                          } else if (value.length < 8) {
                            return "Re-type password at least 8 characters";
                          } else if (value != _passwordController.text) {
                            return "Passwords are not match";
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          // FilteringTextInputFormatter.allow(
                          //     RegExp("^[0-9a-zA-Z ]*")),
                          FilteringTextInputFormatter.allow(
                            RegExp(
                                r"^[0-9a-zA-Z !#$%&'*+\-/=?^_`{|}~@.,<>()]*"),
                          ),

                          LengthLimitingTextInputFormatter(maxInputLength),
                        ],
                        obscureText: !isRetypePasswordVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 3.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.015),
                              child: IconButton(
                                icon: Icon(isRetypePasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                iconSize: screenHeight * 0.03,
                                color: HexColor("#898989"),
                                onPressed: () {
                                  setState(() {
                                    isRetypePasswordVisible =
                                        !isRetypePasswordVisible;
                                  });
                                },
                              ),
                            ),
                            hintText: "Re-enter password",
                            hintStyle: FontStyles.hintTextStyle(context),
                            errorStyle: FontStyles.errorTextStyle(context),
                            contentPadding:
                                EdgeInsets.all(screenWidth * 0.038)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.08, right: screenWidth * 0.08),
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () async {
                          if (singUpFormKey.currentState!.validate()) {
                            // doSignUp(_emailController.text,
                            //     _passwordController.text,
                            //     _reEnterPasswordController.text,
                            //     );
                          }
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontFamily: "inter",
                            letterSpacing: 0.5,
                            fontSize: screenWidth * 0.038,
                            color: HexColor("#ffffff"),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Text(
                      "Already have an account ? Login",
                      style: TextStyle(
                        fontSize: screenWidth * 0.015 + 8,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.035),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
