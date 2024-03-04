import 'package:e_commerce_firebase/core/services/firestore_service.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';

class HomeRepo {
  final _service = FireStoreServices.instance;

  Future<List<ProductModel>> getProductList() async {
    try {
      var list = await _service.getCollectionData(collectionName: "products");

      var response = list.map((e) {
        return ProductModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();

      return response;
    } catch (e) {
      print(e.toString());
      // Handle error or rethrow if necessary
      throw Exception("Failed to fetch product list: $e");
    }
  }
}
