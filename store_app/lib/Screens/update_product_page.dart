import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/showSnackBar.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "Update Product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: "Product Name",
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: "Description",
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputTupe: TextInputType.number,
                  hintText: "Price",
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: "Image",
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(height: 50),
                CustomButton(
                    text: 'Update',
                    color: Colors.white,
                    buttonColor: Colors.blue,
                    onTap: () async {
                      isLoading = true;
                      setState(() {});

                      try {
                        await updateProduct(product);
                        print('sucess');
                        showSnackBar(context, 'Success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
