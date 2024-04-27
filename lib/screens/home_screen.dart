// import 'package:brainiaccommerce2/screens/product_screen.dart';
// import 'package:brainiaccommerce2/screens/product_screen_1.dart';
import 'package:brainiaccommerce2/controller/home_controller.dart';
import 'package:brainiaccommerce2/core/service/client/api_service_client.dart';
import 'package:brainiaccommerce2/core/service/locator/api_service_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/CategoriesWidget.dart';
import '../widgets/FlashSaleItemsWidget.dart';
import '../widgets/PopularItemsWidget.dart';

List imagesList2 = [
  "images/banner_1.jpeg",
  "images/banner_2.jpg",
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var x = Get.put(HomeController());
    x.loadUserInfo();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          hintText: "Search",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFDB3022),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.notifications_none,
                            color: Color(0xFFDB3022),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),

                //Category
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //Category Widget
                CategoriesWidget(),

                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imagesList2.map((image) {
                    return Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 0.7,
                            offset: Offset(0, 4),
                            color: Colors.black26),
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                //Popular Items
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopularItemsWidget(),

                //Flash Sale
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Flash Sale",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                //FlashSale Item Widget
                FlashSaleItemsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
