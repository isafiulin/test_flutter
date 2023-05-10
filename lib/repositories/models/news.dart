// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    this.photo,
    this.title,
    this.isRead,
  });

  final String? photo;
  final String? title;
  final bool? isRead;

  @override
  List<Object> get props => [photo ?? '', title ?? '', isRead ?? false];

  News copyWith({
    String? photo,
    String? title,
    bool? isRead,
  }) {
    return News(
      photo: photo ?? this.photo,
      title: title ?? this.title,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photo': photo,
      'title': title,
      'isRead': isRead,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      photo: map['photo'] != null ? map['photo'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      isRead: map['isRead'] != null ? map['isRead'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
