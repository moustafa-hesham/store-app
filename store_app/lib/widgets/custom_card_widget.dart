import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.products});

  ProductModel products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 140,
            // width: 220,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 80,
                  spreadRadius: 0,
                  offset: Offset(10, 5))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.title.substring(0, 6),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${products.price.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 8,
            child: Image.network(
              products.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
