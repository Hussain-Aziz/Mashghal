import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/data/repository/popular_product_repo.dart';

class PopularProductController
    extends ProductController<PopularProductRepo> {
  PopularProductController({required super.productRepo});
}
