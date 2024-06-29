import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetconnect_app/View/auth/signin.dart';

import '../../font_styles.dart';


class ChangePassword extends StatefulWidget {
   final String email;
  const ChangePassword({super.key, required this.email});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formGlobalKey = GlobalKey<FormState>();
  final int maxInputLength = 16;
 

  bool isPasswordVisible = false;
  bool isRetypePasswordVisible = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _reEnterPasswordController;
  
  @override
  void initState() {
    isPasswordVisible = false;
    isRetypePasswordVisible = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _reEnterPasswordController = TextEditingController();
    super.initState();
   
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    super.dispose();
  }

  // resetSignIn(String password) async {
     
  //   AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
   
  //   bool result = await auth.resetSignIn(context, widget.email, password, widget.resetToken);
   
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = screenHeight * 0.1;
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(left:screenWidth * 0.03),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.green,
                          size: screenWidth * 0.07,
                        )),
                  )),
            )
          ,
      body: SingleChildScrollView(
        child: Padding(
         padding: EdgeInsets.only(
                    left: screenWidth * 0.08, right: screenWidth * 0.08),
          child: Column(
            children: [
            
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    
                     SizedBox(
                  height: screenHeight * 0.1,
                ),
                Text(
                  "Reset Password",
                  style: FontStyles.titleTextStyle(context),
                ),
                SizedBox(
                  height: screenHeight * 0.08,
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
                        }
                         else if (value.length < 8) {
                         
                          return "Password at least 8 characters";
                        }
                        else {
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
                              color: HexColor("#ffffff"),
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
                          contentPadding: EdgeInsets.all(screenWidth * 0.038)),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                     Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: Text(
                        "Re-enter Password",
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
                          
                           return "Password at least 8 characters";
                        } else if (value != _passwordController.text) {
                          
                            return "Passwords are not matched";
                        }  else {
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
                             padding: EdgeInsets.only(
                                    right: screenWidth * 0.015),
                            child: IconButton(
                              icon: Icon(isRetypePasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              iconSize: screenHeight * 0.03,
                              color: HexColor("#ffffff"),
                              onPressed: () {
                                setState(() {
                                  isRetypePasswordVisible =
                                      !isRetypePasswordVisible;
                                });
                              },
                            ),
                          ),
                          hintText:
                              "Re-type password",
                          hintStyle: FontStyles.hintTextStyle(context),
                          errorStyle: FontStyles.errorTextStyle(context),
                          contentPadding: EdgeInsets.all(screenWidth * 0.038)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ));
                        // if (formGlobalKey.currentState!.validate()) {
                        //   resetSignIn(_passwordController.text);
                        // }
                      },
                      child: Text("Reset Password",
                          style: FontStyles.buttonTextStyle(context)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}