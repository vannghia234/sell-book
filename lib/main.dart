import 'package:brainiaccommerce2/screens/cart_screen.dart';
import 'package:brainiaccommerce2/screens/login_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:flutter/material.dart';
import 'screens/ItemScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Brainiac ECommerce",
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Color(0xFFEF6969),
      // ),
      theme: themeData(),
      routes: {
        "/": (context) => LoginScreen(),
        "cartScreen": (context) => CartScreen(),
        "itemScreen": (context) => ItemScreen(),
      },
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Color(0xff8b8b8b),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    fontFamily: 'Muli',
    inputDecorationTheme: inputDecorationTheme(),
    iconTheme: const IconThemeData(),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor, fontSize: 18),
        bodySmall: TextStyle(color: kTextColor, fontSize: 18),
        bodyMedium: TextStyle(color: kTextColor, fontSize: 18)),
    scaffoldBackgroundColor: Colors.white,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 22),
      hintStyle: const TextStyle(fontWeight: FontWeight.normal),
      errorStyle: const TextStyle(fontSize: 14),
      focusColor: kPrimaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: outlineInputBorder(),
      border: outlineInputBorder(),
      enabledBorder: outlineInputBorder());
}

OutlineInputBorder outlineInputBorder() {
  return const OutlineInputBorder(
      gapPadding: 10,
      borderSide: BorderSide(color: kTextColor),
      borderRadius: BorderRadius.all(Radius.circular(28)));
}
