import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/controllers/authenticator.dart';
import 'package:brikoula_client_app/controllers/toaster.dart';
import 'package:brikoula_client_app/ui/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var screenHeight;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var pswController = TextEditingController();

  bool validName, validEmail, validPhone, validPsw, isWaiting, exitConfirmed;

  @override
  void initState() {
    validName = false;
    validEmail = false;
    validPhone = false;
    validPsw = false;
    isWaiting = false;
    exitConfirmed = false;
    // loadEmailFromCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            color: AppColors.primary,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/icons/ic_logo.png'),
                  SizedBox(height: 25,),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: <Widget>[
                                TextField(
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Full name',
                                  ),
                                  autofocus: false,
                                  onChanged: (text) {
                                    validName = text.toString().length > 5;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.start,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                  ),
                                  autofocus: false,
                                  onChanged: (text) {
                                    validEmail = text.toString().length > 3 &&
                                        text.contains('@');
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.start,
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Phone',
                                  ),
                                  autofocus: false,
                                  onChanged: (text) {
                                    validPhone =
                                        (text.toString().startsWith('0') ||
                                                text
                                                    .toString()
                                                    .startsWith('+213')) &&
                                            text.toString().length > 9;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  obscureText: true,
                                  textAlign: TextAlign.start,
                                  controller: pswController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                  ),
                                  autofocus: false,
                                  onChanged: (text) {
                                    validPsw = text.toString().length > 7;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                child: !isWaiting
                                    ? Text(
                                        'Register',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      ),
                                color: AppColors.primary,
                                textColor: Colors.white,
                                padding: EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () async {
                                  if (!isWaiting) {
                                    if (validEmail && validPsw) {
                                      setState(() {
                                        isWaiting = true;
                                      });
                                      await Authenticator.register(
                                        context,
                                        nameController.text,
                                        phoneController.text,
                                        emailController.text,
                                        pswController.text,
                                      );
                                      setState(() {
                                        isWaiting = false;
                                      });
                                    } else if (emailController.text == null ||
                                        !validEmail) {
                                      if (emailController.text == null ||
                                          emailController.text == '') {
                                        Toaster.showErrorToast(
                                            'please enter your email');
                                      } else if (!emailController.text
                                              .contains('@') ||
                                          emailController.text.length < 4) {
                                        Toaster.showErrorToast(
                                            'wrong email input');
                                      }
                                    } else if (pswController.text == null ||
                                        !validPsw) {
                                      if (pswController.text == null ||
                                          pswController.text == '') {
                                        Toaster.showErrorToast(
                                            "password can't be empty");
                                      } else if (pswController.text.length !=
                                          8) {
                                        Toaster.showErrorToast(
                                            'password must be at least 8 characters');
                                      }
                                    } else if (phoneController.text == null ||
                                        !validPhone) {
                                      if (phoneController.text == null ||
                                          phoneController.text == '') {
                                        Toaster.showErrorToast(
                                            "Phone number can't be empty");
                                      } else if (phoneController.text.length <
                                          10) {
                                        Toaster.showErrorToast(
                                            "Phone number must be 10 numbers or more");
                                      }
                                    } else if (nameController.text == null ||
                                        !validName) {
                                      if (nameController.text == null ||
                                          nameController.text == '') {
                                        Toaster.showErrorToast(
                                            "name can't be empty");
                                      } else if (nameController.text.length <
                                          6) {
                                        Toaster.showErrorToast(
                                            "name must be more than 6 characters");
                                      }
                                    } else {
                                      Toaster.showErrorToast(
                                          'check your information and try again');
                                      print(
                                          'Invalid info :\nemail $validEmail\npsw $validPsw');
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                        // onPressed: gotoRegister,
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
