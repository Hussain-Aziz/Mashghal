import 'package:json_annotation/json_annotation.dart';
import 'package:mushaghal/models/product_model.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(this.total_size, this.type_id, this.offset, this.products);

  int total_size;
  int type_id;
  int offset;
  List<ProductModel> products;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
