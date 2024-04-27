import 'package:brainiaccommerce2/core/ui/style/base_text_style.dart';
import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.description,
  });
  final String name;
  final String price;
  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 9,
                  )
                ]),
            child: Container(
              alignment: Alignment.center,
              child: Image.network(
                imgUrl,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: BaseTextStyle.label2(),
          ),
          Text(
            description,
            style: BaseTextStyle.body3(color: Colors.grey.shade500),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${price}đ",
                style: BaseTextStyle.label2(color: kPrimaryColor),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
