import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetconnect_app/View/auth/signup.dart';

import '../../font_styles.dart';
import '../main/bottombar.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInFormKey = GlobalKey<FormState>();
  final int maxInputLength = 16;
  bool isPasswordVisible = false;
  late TextEditingController _emailOrPhoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    isPasswordVisible = false;
    _emailOrPhoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.08, right: screenWidth * 0.08),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Text(
                "Sign In",
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
                key: signInFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailOrPhoneController,
                      style: FontStyles.bodyTextStyle(context),
                      cursorColor: Colors.green,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required.';
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow(
                        //     RegExp("^[0-9a-zA-Z\@\.]*")),
                        FilteringTextInputFormatter.allow(
                            RegExp("^[0-9a-zA-Z@.+]*"))
                      ],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter your email",
                          hintStyle: FontStyles.hintTextStyle(context),
                          errorStyle: FontStyles.errorTextStyle(context),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 3.0,
                            ),
                          ),
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
                          return "Password is required.";
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow(
                        //     RegExp("^[0-9a-zA-Z ]*")),
                        FilteringTextInputFormatter.allow(
                          RegExp(r"^[0-9a-zA-Z !#$%&'*+\-/=?^_`{|}~@.,<>()]*"),
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
                          contentPadding: EdgeInsets.all(screenWidth * 0.04)),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.035),
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(
                          fontSize: screenWidth * 0.015 + 9,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w400,
                          color: Colors.green),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Center(
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
                      // if (signInFormKey.currentState!.validate()) {
                      //   doSignIn(_emailOrPhoneController.text, _passwordController.text);
                      // }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBar(),
                          ));
                    },
                    child: Text("Sign In",
                        style: FontStyles.buttonTextStyle(context)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03),
                  child: Text(
                    "Do not have an account? Sign Up",
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
    );
  }
}
