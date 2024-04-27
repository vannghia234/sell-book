import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/screens/payment_method_screen.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:brainiaccommerce2/widgets/container_buton_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Orderlist
class CartScreen extends StatelessWidget {
  // const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  "Order List",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ...List.generate(
                  2,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: CartItem(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items:",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "4",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub- Total",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "\507.000đ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery:",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "\10.000đ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\517.000đ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen(),
                        ));
                  },
                  child: ContainerButtonModel(
                    itext: "Check Out",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              "https://i.pinimg.com/736x/e4/aa/4e/e4aa4e0090a3612f5b02de1300cd0157.jpg",
              height: 80,
              fit: BoxFit.contain,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sách học Tiếng anh 7",
                        style:
                            BaseTextStyle.body3(color: Colors.grey.shade700)),
                    Text("400.000 đ",
                        style: BaseTextStyle.label2(color: kPrimaryColor)),
                  ],
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[100])),
                    iconSize: 18,
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: kPrimaryColor,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "1",
                    style: BaseTextStyle.body2(),
                  ),
                ),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[100])),
                    iconSize: 18,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ))
              ],
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
