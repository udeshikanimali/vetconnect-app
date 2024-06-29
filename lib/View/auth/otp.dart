import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetconnect_app/View/auth/change_password.dart';

import '../../font_styles.dart';

class OTP extends StatefulWidget {
  final String email;
  const OTP({super.key, required this.email});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final formGlobalKey = GlobalKey<FormState>();
  final int maxInputLength = 15;
  late TextEditingController _otpController;
  bool otpError = false;
  bool buttonEnabled = true;

  int _countdownSeconds = 150;
  late Timer _countdownTimer;

  @override
  void initState() {
    _otpController = TextEditingController();
    startCountdownTimer();
    super.initState();
    buttonEnabled = true;
  }

  @override
  void dispose() {
    _otpController.dispose();
    _countdownTimer.cancel();
    super.dispose();
  }

  void startCountdownTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownSeconds > 0) {
          _countdownSeconds--;
        } else {
          _countdownTimer.cancel();
        }
      });
    });
  }

  // sendOTP(String otp) async {

  //   AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
  //   // PageLoader.showLoader(context);
  //   bool result = await auth.sendOTP(context, widget.email, otp);

  //   }
  // }

  // sendEmailForOTP(String email) async {
  //   AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

  //   auth.sendEmailForOTP(context, email);
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
              padding: EdgeInsets.only(left: screenWidth * 0.03),
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.08, right: screenWidth * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Text(
                  "Enter OTP code",
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
                        "OTP",
                        style: TextStyle(
                            fontSize: screenWidth * 0.015 + 10,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Form(
                  key: formGlobalKey,
                  child: TextFormField(
                    controller: _otpController,
                    style: FontStyles.bodyTextStyle(context),
                    cursorColor: Colors.green,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          otpError = true;
                        });
                        return "Required otp";
                      } else if (value.length > maxInputLength) {
                        setState(() {
                          otpError = true;
                        });
                        return "Otp cannot exceed 15 characters";
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("^[0-9]*")),
                      LengthLimitingTextInputFormatter(maxInputLength),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter otp code here",
                        hintStyle: FontStyles.hintTextStyle(context),
                        errorStyle: FontStyles.errorTextStyle(context),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(screenWidth * 0.038)),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                GestureDetector(
                  onTap: () {
                    if (_countdownSeconds == 0) {
                      // sendEmailForOTP(widget.email);
                      // Restart the countdown timer
                      _countdownSeconds = 150;
                      startCountdownTimer();
                    }
                  },
                  child: Text(
                    _countdownSeconds > 0
                        ? '${_countdownSeconds ~/ 60}:${(_countdownSeconds % 60).toString().padLeft(2, '0')}'
                        : 'Resend code',
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w400,
                      color:
                          _countdownSeconds == 0 ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
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
                        // if (formGlobalKey.currentState!.validate()) {
                        //   sendOTP(_otpController.text);
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(
                                email: widget.email,
                              ),
                            ));
                      },
                      child: Text("Continue",
                          style: FontStyles.buttonTextStyle(context)),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
