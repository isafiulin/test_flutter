// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final String title;
  final String address; //maybe it could be another type
  final String timeAll; //time from to
  const Shop({
    required this.title,
    required this.address,
    required this.timeAll,
  });

  Shop copyWith({
    String? title,
    String? address,
    String? timeAll,
  }) {
    return Shop(
      title: title ?? this.title,
      address: address ?? this.address,
      timeAll: timeAll ?? this.timeAll,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'address': address,
      'timeAll': timeAll,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      title: map['title'] as String,
      address: map['address'] as String,
      timeAll: map['timeAll'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) => Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, address, timeAll];
}
