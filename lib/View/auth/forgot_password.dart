import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../font_styles.dart';
import 'otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formGlobalKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // sendEmailForOTP(String email) async {

  //   AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
  //   // PageLoader.showLoader(context);
  //   bool result = await auth.sendEmailForOTP(context, email);

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
                  "Enter your email for get your OTP",
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
                  key: formGlobalKey,
                  child: TextFormField(
                    controller: _emailController,
                    style: FontStyles.bodyTextStyle(context),
                    cursorColor: Colors.green,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required email";
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
                        contentPadding: EdgeInsets.all(screenWidth * 0.038)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTP(
                                email: _emailController.text,
                              ),
                            ));
                        // if (formGlobalKey.currentState!.validate()) {
                        //   sendEmailForOTP(_emailController.text);
                        // }
                      },
                      child: Text("Send OTP",
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
