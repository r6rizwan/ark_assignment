//This is the Dart Data Class Model that will be used in the app.

import 'dart:convert';
import 'package:flutter/foundation.dart';

class Count {
  int count;
  List<String> entries;
  Count({
    required this.count,
    required this.entries,
  });

  Count copyWith({
    int? count,
    List<String>? entries,
  }) {
    return Count(
      count: count ?? this.count,
      entries: entries ?? this.entries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'entries': entries,
    };
  }

  factory Count.fromMap(Map<String, dynamic> map) {
    return Count(
      count: map['count']?.toInt() ?? 0,
      entries: List<String>.from(map['entries']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Count.fromJson(String source) => Count.fromMap(json.decode(source));

  @override
  String toString() => 'Count(count: $count, entries: $entries)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Count &&
        other.count == count &&
        listEquals(other.entries, entries);
  }

  @override
  int get hashCode => count.hashCode ^ entries.hashCode;
}

class Entries {
  String API;
  String Description;
  String Auth;
  bool HTTPS;
  String Cors;
  String Link;
  String Category;
  Entries({
    required this.API,
    required this.Description,
    required this.Auth,
    required this.HTTPS,
    required this.Cors,
    required this.Link,
    required this.Category,
  });

  Entries copyWith({
    String? API,
    String? Description,
    String? Auth,
    bool? HTTPS,
    String? Cors,
    String? Link,
    String? Category,
  }) {
    return Entries(
      API: API ?? this.API,
      Description: Description ?? this.Description,
      Auth: Auth ?? this.Auth,
      HTTPS: HTTPS ?? this.HTTPS,
      Cors: Cors ?? this.Cors,
      Link: Link ?? this.Link,
      Category: Category ?? this.Category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'API': API,
      'Description': Description,
      'Auth': Auth,
      'HTTPS': HTTPS,
      'Cors': Cors,
      'Link': Link,
      'Category': Category,
    };
  }

  factory Entries.fromMap(Map<String, dynamic> map) {
    return Entries(
      API: map['API'] ?? '',
      Description: map['Description'] ?? '',
      Auth: map['Auth'] ?? '',
      HTTPS: map['HTTPS'] ?? false,
      Cors: map['Cors'] ?? '',
      Link: map['Link'] ?? '',
      Category: map['Category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Entries.fromJson(String source) =>
      Entries.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Entries(API: $API, Description: $Description, Auth: $Auth, HTTPS: $HTTPS, Cors: $Cors, Link: $Link, Category: $Category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Entries &&
        other.API == API &&
        other.Description == Description &&
        other.Auth == Auth &&
        other.HTTPS == HTTPS &&
        other.Cors == Cors &&
        other.Link == Link &&
        other.Category == Category;
  }

  @override
  int get hashCode {
    return API.hashCode ^
        Description.hashCode ^
        Auth.hashCode ^
        HTTPS.hashCode ^
        Cors.hashCode ^
        Link.hashCode ^
        Category.hashCode;
  }
}
