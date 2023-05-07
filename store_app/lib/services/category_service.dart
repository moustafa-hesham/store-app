import 'dart:convert';

import '../constants.dart';
import '../helper/api.dart';
import '../models/products_model.dart';

import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data =
        await Api().get(url: '$kBaseURL/category/$categoryName');

    List<ProductModel> productList = [];

    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
