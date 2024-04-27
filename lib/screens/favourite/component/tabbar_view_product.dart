import 'package:brainiaccommerce2/screens/favourite/component/product-card-item.dart';
import 'package:flutter/material.dart';

class TabbarViewProduct extends StatelessWidget {
  const TabbarViewProduct({super.key});
  // final List<Product> productLists;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 40,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 4 / 7,
      children: [...List.generate(4, (index) => ProductCardItem())],
    );
    // : Center(
    //     child: SvgPicture.asset(
    //       'assets/images/nodata.svg',
    //       height: 500,
    //       width: Get.width,
    //       fit: BoxFit.cover,
    //     ),
    //   ));
  }
}
