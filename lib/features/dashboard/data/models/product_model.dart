// features/product/data/models/product_model.dart
import 'package:architecture_pattern/core/utils/json_utils.dart';

class ProductModel {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  ProductModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantoneValue: json['pantone_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'color': color,
      'pantone_value': pantoneValue,
    };
  }
}
