import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/data/repository/recommended_product_repo.dart';

class RecommendedProductController extends ProductController<RecommendedProductRepo> {
  RecommendedProductController({required super.productRepo});
}
