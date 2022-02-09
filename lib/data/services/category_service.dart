import 'package:e_shop/config/consts_strings.dart';
import 'package:e_shop/data/model/category_model.dart';
import 'package:e_shop/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load Categories');
    }
  }
  static Future <List<ProductModel>> getProductsByCategory(String categoryName) async{
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    }else{
      return throw Exception('Failed to load products');
    }

  }
}
