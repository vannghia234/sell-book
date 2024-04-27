import 'package:brainiaccommerce2/screens/complete_sign_up_screen.dart';
import 'package:brainiaccommerce2/screens/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController accountIdController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberIdController = TextEditingController();

  late List<TextEditingController> controllerLists;
  @override
  void initState() {
    controllerLists = [
      accountIdController,
      fullNameController,
      phoneNumberController,
      numberIdController
    ];
    super.initState();
  }

  @override
  void dispose() {
    controllerLists.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

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
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: accountIdController,
                    decoration: InputDecoration(
                      labelText: "AccountID",
                      hintText: "Enter your AccountID",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: "FullName",
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "PhoneNumber",
                      hintText: "Enter your phone",
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: numberIdController,
                    decoration: InputDecoration(
                      labelText: "NumberID",
                      hintText: "Enter your numberID",
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CommonButton(
                    text: "Continue",
                    press: () {
                      if (phoneNumberController.text.length != 10) {
                        showSnackBar(
                            content: "Phone number must be 10 characters",
                            state: SnackbarState.fail);
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompleteSignUpScreen(
                              data: RegisterData(
                                  accountID: accountIdController.text,
                                  fullName: fullNameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  numberID: numberIdController.text),
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
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
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Login Here",
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
