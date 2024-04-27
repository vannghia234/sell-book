import 'package:brainiaccommerce2/controller/authentication_controller.dart';
import 'package:brainiaccommerce2/core/ui/style/base_color.dart';
import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/common_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterData {
  final String accountID;
  final String fullName;
  final String phoneNumber;
  final String numberID;

  RegisterData(
      {required this.accountID,
      required this.fullName,
      required this.phoneNumber,
      required this.numberID});
}

class CompleteSignUpScreen extends StatefulWidget {
  const CompleteSignUpScreen({super.key, required this.data});
  final RegisterData data;

  @override
  State<CompleteSignUpScreen> createState() => _CompleteSignUpScreenState();
}

class _CompleteSignUpScreenState extends State<CompleteSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Male',
      'Female',
    ];
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController rePasswordController = TextEditingController();
    final TextEditingController BirthdayController = TextEditingController();
    final TextEditingController schoolYearController = TextEditingController();
    final TextEditingController schoolKeyController = TextEditingController();
    String? gender;
    DropdownButtonFormField2<String> _dropDownButton(List<String> genderItems) {
      return DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          // Add more decoration..
        ),
        hint: Text(
          'Select Your Gender',
          style: BaseTextStyle.body2(color: BaseColor.greyNeutral600),
        ),
        items: genderItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: BaseTextStyle.body2()),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when selected item is changed.
          gender = value;
        },
        onSaved: (value) {
          // selectedValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/brainiac.png"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your Password",
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Re-Password",
                      hintText: "Enter your Re-Password",
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 15),
                  _dropDownButton(genderItems),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: BirthdayController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Birthday",
                      hintText: "Enter your Birthday",
                      prefixIcon: Icon(Icons.cake),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: schoolYearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "School Year",
                      hintText: "Enter your school year",
                      prefixIcon: Icon(Icons.school),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: schoolKeyController,
                    decoration: InputDecoration(
                      labelText: "SchoolKey",
                      hintText: "Enter your SchoolKey",
                      prefixIcon: Icon(Icons.key),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CommonButton(
                    text: "Register",
                    press: () async {
                      if (passwordController.text.isEmpty ||
                          rePasswordController.text.isEmpty ||
                          BirthdayController.text.isEmpty ||
                          schoolKeyController.text.isEmpty ||
                          schoolYearController.text.isEmpty) {
                        showSnackBar(
                            content: "Please fill in all fields",
                            state: SnackbarState.fail);
                        return;
                      }
                      if (passwordController.text !=
                          rePasswordController.text) {
                        showSnackBar(
                            content: "Password not match!",
                            state: SnackbarState.fail);
                        return;
                      }
                      if (gender == null) {
                        showSnackBar(
                            content: "Please enter your gender",
                            state: SnackbarState.fail);
                        return;
                      }
                      AuthenticationController controller = Get.find();
                      var rs = await controller.register(
                          accountId: widget.data.accountID,
                          fullName: widget.data.fullName,
                          phoneNumber: widget.data.phoneNumber,
                          numberId: widget.data.numberID,
                          password: passwordController.text,
                          rePassword: rePasswordController.text,
                          gender: gender!,
                          birthDay: BirthdayController.text,
                          schoolKey: schoolKeyController.text,
                          schoolYear: schoolYearController.text);
                      print(rs);
                      if (rs) {
                        showSnackBar(
                          content: "Register Successfully",
                        );
                        return;
                      } else {
                        showSnackBar(
                            content: "Registered account already exists",
                            state: SnackbarState.fail);
                        return;
                      }
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
                            fontWeight: FontWeight.w600,
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
