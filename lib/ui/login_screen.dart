import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/controllers/authenticator.dart';
import 'package:brikoula_client_app/controllers/toaster.dart';
import 'package:brikoula_client_app/ui/home_screen.dart';
import 'package:brikoula_client_app/ui/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var screenHeight;
  var emailController = TextEditingController();
  var pswController = TextEditingController();

  bool validEmail, validPsw, isWaiting, exitConfirmed;

  @override
  void initState() {
    validEmail = false;
    validPsw = false;
    isWaiting = false;
    exitConfirmed = false;
    // loadEmailFromCache();
    super.initState();
  }

  Future<bool> _login()async {
    await Future.delayed(Duration(seconds: 5));
    return true;
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
                                'Login',
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
                                        'Login',
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
                                      await _login();
                                      // await Authenticator.logIn(
                                      //   context,
                                      //   emailController.text,
                                      //   pswController.text,
                                      // );
                                      setState(() {
                                        isWaiting = false;
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(builder: (context) => HomeScreen()));
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
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: Divider(
                                        color: AppColors.primary,
                                        height: 36,
                                      )),
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(color: AppColors.primary),
                                ),
                                Expanded(
                                  child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: Divider(
                                        color: AppColors.primary,
                                        height: 36,
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                  child: Icon(
                                    Icons.gesture,
                                    size: 20,
                                  ),
                                  color: AppColors.primary,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: () {}),
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
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                        // onPressed: gotoRegister,
                        textColor: Colors.white,
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => RegisterScreen()));
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
