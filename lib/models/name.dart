import 'dart:convert';

class Name {
  final String title;
  final String first;
  final String last;
  Name({
    this.title,
    this.first,
    this.last,
  });

  Name copyWith({
    String title,
    String first,
    String last,
  }) {
    return Name(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Name(
      title: map['title'],
      first: map['first'],
      last: map['last'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));

  @override
  String toString() => 'Name(title: $title, first: $first, last: $last)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Name &&
      o.title == title &&
      o.first == first &&
      o.last == last;
  }

  @override
  int get hashCode => title.hashCode ^ first.hashCode ^ last.hashCode;
}