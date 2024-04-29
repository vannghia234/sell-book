import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/screens/navigation_screen.dart';
import 'package:brainiaccommerce2/screens/signup_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();

    super.dispose();
  }

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo-slack.png",
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextField(
                    controller: controllerUsername,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: controllerPassword,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: (isHidden)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => ForgotPassScreen(),
                  //           ));
                  //     },
                  //     child: Text(
                  //       "Forgot password?",
                  //       style: TextStyle(
                  //         color: kPrimaryColor,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  CommonButton(
                      text: "Login",
                      press: () async {
                        if (this.controllerUsername.text.isEmpty ||
                            this.controllerPassword.text.isEmpty) {
                          showSnackBar(
                              content: "Please fill in all Fields",
                              state: SnackbarState.fail);
                          return;
                        }
                        AuthenticationController x = Get.find();
                        showLoadingAnimation(context);
                        var isSuccess = await x.login(
                            accountId: controllerUsername.text,
                            password: controllerPassword.text);
                        await Future.delayed(Duration(milliseconds: 1000));
                        Navigator.pop(context);
                        if (isSuccess) {
                          showSnackBar(content: "Login Successfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationScreen(),
                              ));
                          return;
                        } else {
                          showSnackBar(
                              content: "Login Failure",
                              state: SnackbarState.fail);
                          return;
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text(
                          "Sign Up Here",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
