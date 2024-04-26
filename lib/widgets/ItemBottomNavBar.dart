import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
// import '../screens/payment_method_screen.dart';

class ItemBottomNavBar extends StatelessWidget {
  //const ItemBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\14.850đ",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.red),
            //     padding: MaterialStateProperty.all(
            //       EdgeInsets.symmetric(
            //         vertical: 13,
            //         horizontal: 15,
            //       ),
            //     ),
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //   ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              child: SizedBox(
                width: 200, 
                height: 50,
                child: ContainerButtonModel(
                  itext: "Check Out",
                  containerWidth: MediaQuery.of(context).size.width,
                  bgColor: Color(0xFFDB3022),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
