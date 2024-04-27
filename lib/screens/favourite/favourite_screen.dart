import 'package:brainiaccommerce2/screens/favourite/component/tabbar_view_product.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = '/favourite';
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'My Favourite',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TabbarViewProduct()
          ]),
        ),
      ),
    );
  }
}
