// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    this.photo,
    this.title,
    this.isFavorite,
    this.inStock,
    this.price,
  });

  final String? photo;
  final String? title;
  final bool? isFavorite;
  final int? inStock;
  final double? price;

  Product copyWith({
    String? photo,
    String? title,
    bool? isFavorite,
    int? inStock,
    double? price,
  }) {
    return Product(
      photo: photo ?? this.photo,
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      inStock: inStock ?? this.inStock,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photo': photo,
      'title': title,
      'isFavorite': isFavorite,
      'inStock': inStock,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      photo: map['photo'] != null ? map['photo'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
      inStock: map['inStock'] != null ? map['inStock'] as int : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [photo ?? '', title ?? '', isFavorite ?? false, inStock ?? 0, price ?? 0];
}
