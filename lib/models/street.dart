import 'dart:convert';

class Street {
  final int number;
  final String name;
  Street({
    this.number,
    this.name,
  });

  Street copyWith({
    int number,
    String name,
  }) {
    return Street(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory Street.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Street(
      number: map['number']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Street.fromJson(String source) => Street.fromMap(json.decode(source));

  @override
  String toString() => 'Street(number: $number, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Street &&
      o.number == number &&
      o.name == name;
  }

  @override
  int get hashCode => number.hashCode ^ name.hashCode;
}