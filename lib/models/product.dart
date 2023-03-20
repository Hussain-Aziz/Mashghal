import 'package:json_annotation/json_annotation.dart';
import 'package:mushaghal/models/product_model.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'product.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
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
