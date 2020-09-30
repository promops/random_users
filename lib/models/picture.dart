import 'dart:convert';

class Picture {
  final String large;
  final String medium;
  final String thumbnail;
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  Picture copyWith({
    String large,
    String medium,
    String thumbnail,
  }) {
    return Picture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Picture(
      large: map['large'],
      medium: map['medium'],
      thumbnail: map['thumbnail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Picture.fromJson(String source) => Picture.fromMap(json.decode(source));

  @override
  String toString() => 'Picture(large: $large, medium: $medium, thumbnail: $thumbnail)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Picture &&
      o.large == large &&
      o.medium == medium &&
      o.thumbnail == thumbnail;
  }

  @override
  int get hashCode => large.hashCode ^ medium.hashCode ^ thumbnail.hashCode;
}